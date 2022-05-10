class ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::DeployServerProfileButton < ApplicationHelper::Button::Basic
  needs :@record

  def disabled?
    @record.assigned_server_profile.nil? or !@record.associated_server.nil?
  end
end
