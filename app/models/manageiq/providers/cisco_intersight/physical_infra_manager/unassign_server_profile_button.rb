class ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::UnassignServerProfileButton < ApplicationHelper::Button::Basic
  needs :@record

  def disabled?
    @record.associated_server_profile.nil?
  end
end
