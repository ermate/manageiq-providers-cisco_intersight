class ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::DecommissionServerButton < ApplicationHelper::Button::Basic
  needs :@record

  def disabled?
    @record.power_state.eql?("decommissioned")
  end
end
