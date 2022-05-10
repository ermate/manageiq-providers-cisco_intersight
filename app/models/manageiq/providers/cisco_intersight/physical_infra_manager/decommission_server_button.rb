class ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::DecommissionServerButton < ApplicationHelper::Button::Basic
  needs :@record

  def disabled?
    # TODO:
    return true
  end
end
