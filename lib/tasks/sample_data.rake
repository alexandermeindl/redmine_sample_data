# frozen_string_literal: true

desc <<~DESCRIPTION
  Seed sample data for benchmark tests - do not use it with production data!

  Examples:
    cd $REDMINE_ROOT
    export RAILS_ENV=test
    bundle exec rake db:drop db:create db:migrate
    bundle exec rake redmine:load_default_data REDMINE_LANG=en
    bundle exec rake redmine:plugins:migrate

    # create data for benchmark tests
    time bundle exec rake redmine:sample_data
DESCRIPTION

namespace :redmine do
  task sample_data: :environment do
    user_amount = ENV.fetch 'USERS', 1000
    project_amount = ENV.fetch 'PROJECTS', 2000
    issue_per_project_amount = ENV.fetch 'PROJECT_ISSUES', 100
    members_per_project = ENV.fetch 'PROJECT_MEMBERS', 50
    timelog_per_issue = ENV.fetch 'TIMELOG_PER_ISSUE', 2
    activity = TimeEntryActivity.find_by name: 'Design'
    timelog_start = Date.new(2010, 1, 1).to_time
    timelog_end = Time.zone.today.to_time

    # Create users
    print 'Create users'
    user_amount.times do |user_num|
      user = User.new(
        firstname: "Firstname #{user_num}",
        lastname: "Lastname #{user_num}",
        mail: "user#{user_num}@example.net",
        must_change_passwd: false
      )
      user.login = "user#{user_num}"
      user.language = 'en'
      user.password = "user#{user_num}password"
      user.save!
      print '.'
    end

    puts ''
    # Create projects
    print 'Create projects'
    project_amount.times do |project_num|
      project = Project.create!(
        name: "Project #{project_num}",
        identifier: "project-#{project_num}",
        is_public: false,
        description: "Description for project #{project_num}"
      )

      # Assign members
      user_start_pos = rand 10..(1000 - members_per_project)
      members_per_project.times do |member_num|
        @userid = user_start_pos + member_num
        Member.create! project_id: project.id, user_id: @userid, role_ids: [3, 4]
      end

      member_user = User.find_by id: @userid
      issue_per_project_amount.times do |issue_num|
        status_id = rand 1..6
        issue = Issue.create!(
          subject: "Issue #{issue_num} for project #{project_num}",
          description: "Description for Issue #{issue_num} in project #{project_num}",
          tracker_id: rand(1..3),
          author_id: member_user.id,
          status_id: status_id,
          priority: IssuePriority.first,
          project_id: project.id
        )

        timelog_per_issue.times do |timelog_num|
          TimeEntry.create(spent_on: Time.zone.at((timelog_start.to_f - timelog_end.to_f) * rand + timelog_end.to_f),
                           hours: rand(1..10),
                           issue: issue,
                           project: project,
                           comments: "Time log #{timelog_num} with issue #{issue_num} in project #{project_num}",
                           user: member_user,
                           activity: activity)
        end
      end
      print '.'
    end
  end
end
