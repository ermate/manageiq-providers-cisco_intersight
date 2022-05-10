class ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::RecommissionServerButton < ApplicationHelper::Button::Basic
  needs :@record

  def disabled?
    # TODO:
    return true
  end
end
