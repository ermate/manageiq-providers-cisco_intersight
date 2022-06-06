module ManageIQ
  module Providers
    module CiscoIntersight
      module ToolbarOverrides
        class PhysicalServersCenter < ::ApplicationHelper::Toolbar::Override
          button_group(
            'physical_server_policy_choice',
            [
              select(
                :physical_server_lifecycle_choice,
                nil,
                t = N_('Intersight'),
                t,
                :enabled => true,
                :items   => [
                  api_button(
                    :physical_server_decommission,
                    nil,
                    N_('Decommission server'),
                    N_('Decommission'),
                    :icon    => "pficon pficon-off fa-lg",
                    :api     => {
                      :action => 'decommission_server',
                      :entity => 'physical_server'
                    },
                    :confirm => N_("Decommission selected servers?"),
                    :enabled => true,
                    :onwhen  => "1",
                    # TODO: feature doesn't work as intended
                    :options => {:feature => :decommission}
                  ),
                  api_button(
                    :physical_server_recommission,
                    nil,
                    N_('Recommission server'),
                    N_('Recommission'),
                    :icon    => "pficon pficon-off fa-lg",
                    :api     => {
                      :action => 'recommission_server',
                      :entity => 'physical_server'
                    },
                    :confirm => N_("Recommission selected servers?"),
                    :enabled => true,
                    :onwhen  => "1",
                    # TODO: feature doesn't work as intended
                    :options => {:feature => :recommission}
                  ),
                  separator(),
                  button(
                    :physical_server_profile_assign_server,
                    'pficon pficon-add-circle-o fa-lg',
                    t = N_('Assign Server Profile'),
                    t,
                    :data  => {'function'      => 'sendDataWithRx',
                               'function-data' => {:controller     => 'provider_dialogs',
                                                   :button         => :physical_server_profile_assign_server,
                                                   :modal_title    => N_('Assign Server Profile'),
                                                   :component_name => 'ServerProfileForm',
                                                   :action         => 'assign_server'}},
                    :onwhen  => "1",
                    # TODO: :klass assignment doesn't work correctly for our desired functionality - options are hidden no matter the condition defined in the class
                    :klass  => ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::AssignServerProfileButton
                  ),
                  button(
                    :physical_server_profile_deploy_server,
                    'pficon fa-lg',
                    t = N_('Deploy Server Profile'),
                    t,
                    :data  => {'function'      => 'sendDataWithRx',
                               'function-data' => {:controller     => 'provider_dialogs',
                                                   :button         => :physical_server_profile_deploy_server,
                                                   :modal_title    => N_('Deploy Server Profile'),
                                                   :component_name => 'ServerProfileForm',
                                                   :action         => 'deploy_server'}},
                    :onwhen  => "1",
                    # TODO: :klass assignment doesn't work correctly for our desired functionality - options are hidden no matter the condition defined in the class
                    :klass  => ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::DeployServerProfileButton
                  ),
                  button(
                    :physical_server_profile_unassign_server,
                    'pficon fa-lg',
                    t = N_('Unassign Server Profile'),
                    t,
                    :data  => {'function'      => 'sendDataWithRx',
                               'function-data' => {:controller     => 'provider_dialogs',
                                                   :button         => :physical_server_profile_unassign_server,
                                                   :modal_title    => N_('Unassign Server Profile'),
                                                   :component_name => 'ServerProfileForm',
                                                   :action         => 'unassign_server'}},
                    :onwhen  => "1",
                    # TODO: :klass assignment doesn't work correctly for our desired functionality - options are hidden no matter the condition defined in the class
                    :klass  => ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::UnassignServerProfileButton
                  ),
                  separator,
                  button(
                    :physical_server_profile_deploy_server,
                    'pficon fa-lg',
                    t = N_('Deploy Server Profile'),
                    t,
                    :data  => {'function'      => 'sendDataWithRx',
                               'function-data' => {:controller     => 'provider_dialogs',
                                                   :button         => :physical_server_profile_deploy_server,
                                                   :modal_title    => N_('Deploy Server Profile'),
                                                   :component_name => 'ServerProfileForm',
                                                   :action         => 'deploy_server'}},
                    :klass  => ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::DeployServerProfileButton
                  ),
                  button(
                    :physical_server_profile_unassign_server,
                    'pficon fa-lg',
                    t = N_('Unassign Server Profile'),
                    t,
                    :data  => {'function'      => 'sendDataWithRx',
                               'function-data' => {:controller     => 'provider_dialogs',
                                                   :button         => :physical_server_profile_unassign_server,
                                                   :modal_title    => N_('Unassign Server Profile'),
                                                   :component_name => 'ServerProfileForm',
                                                   :action         => 'unassign_server'}},
                    :klass  => ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::UnassignServerProfileButton
                  )
                ]
              )
            ]
          )
        end
      end
    end
  end
end
