namespace :db do
  desc "Fill database with initial statuses"
  task populate: :environment do
    Status.create value: 'Waiting for Staff Response'
    Status.create value: 'Waiting for Customer'
    Status.create value: 'On Hold'
    Status.create value: 'Cancelled'
    Status.create value: 'Completed'
  end
end
