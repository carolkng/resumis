module Api
  module V1
    class ProjectsController < ApiController
      before_action :validate_payload_type, only: [:create, :update]

      def index
        render jsonapi: projects, include: include_params
      end

      def show
        render jsonapi: project, include: include_params
      end

      def create
        new_project = Project.new(project_params)
        if new_project.save
          render jsonapi: new_project, status: :created, location: new_project
        else
          render_error resource: new_project
        end
      end

      def update
        project.update_attributes(project_params)
        if project.save
          render jsonapi: project
        else
          render_error resource: project
        end
      end

      def destroy
        project.destroy!
        head :no_content
      end

      private

      def include_params
        @include_params ||= begin
          assocs = if params[:include].is_a?(String)
            params[:include].split(',')
          else
            params[:include] || []
          end
          assocs.select { |a| a =~ /^(status|categories)/ }
        end
      end

      def project
        @project ||= Project.find(params[:id])
      end

      def projects
        @projects ||= Project.all
      end

      def project_params
        ActiveModelSerializers::Deserialization.jsonapi_parse!(
          params, only: [
            :slug, :name, :short_description, :description, :status,
            :categories, :start_date, :end_date
          ]
        ).merge(user: current_tenant)
      end
    end
  end
end
