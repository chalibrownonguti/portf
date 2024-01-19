class ProjectDeletionJob < ApplicationJob
  #  skip_before_action :authorize, only: [:perform]
   
  queue_as :low_priority
          #  :high_priority

  def perform(id)
    project = Project.find_by(id: id)

     if project.present? && project.archive?
        project.destroy
    end
    # Do something later
    puts "MMMMM"
    puts "deleted"
  end
end
