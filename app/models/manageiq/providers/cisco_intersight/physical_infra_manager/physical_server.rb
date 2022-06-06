module ManageIQ::Providers::CiscoIntersight
  class PhysicalInfraManager::PhysicalServer < ::PhysicalServer
    include_concern 'Provisioning'

    def self.display_name(number = 1)
      n_('Physical Server (CiscoIntersight)', 'Physical Servers (CiscoIntersight)', number)
    end

    def provider_object(connection)
      connection.find!(ems_ref)
    end

    def power_down
      change_state(:power_down)
    end

    def power_up
      change_state(:power_up)
    end

    supports :recommission do
      unsupported_reason_add(:recommission, _("Cannot recommission an active server")) if !@record.power_state.eql?("decommissioned")
    end

    supports :decommission do
      unsupported_reason_add(:decommission, _("Cannot decommission an inactive server")) if @record.power_state.eql?("decommissioned")
    end
  end
end
