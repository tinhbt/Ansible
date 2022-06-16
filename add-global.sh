cat << EOF > /etc/kolla/globals.yml
---
# You can use this file to override _any_ variable throughout Kolla.
# Additional options can be found in the
# 'kolla-ansible/ansible/group_vars/all.yml' file. Default value of all the
# commented parameters are shown here, To override the default value uncomment
# the parameter and change its value.

prechecks_enable_host_ntp_checks: "false"
kolla_base_distro: "centos"
kolla_install_type: "source"
openstack_release: "train"
enable_chrony: "no"
#khong su dung IP VIP thi disable HA proxy
enable_haproxy: "no"
nova_compute_virt_type: "qemu" 
# Dai internal API
#kolla_external_vip_interface: "enp0s8"
kolla_internal_vip_address: "$(hostname -I | awk '{print $1}')"
network_interface: "eth0"
# Dai Mngt Provider
neutron_external_interface: "eth1"
# Cho phep dai external provider
enable_neutron_provider_networks: "yes"
enable_cinder: "yes"
enable_cinder_backend_lvm: "yes"
enable_cinder_backup: "no"
#enable_octavia: "yes"
#
#octavia_certs_country: VN
#octavia_certs_state: Hanoi
#octavia_certs_organization: OpenStack
#octavia_certs_organizational_unit: Octavia
#
#octavia_network_interface: eth0
#
#octavia_amp_flavor:
#  name: "amphora"
#  is_public: yes
#  vcpus: 1
#  ram: 1024
#  disk: 5
#
#octavia_amp_network:
#  name: lb-mgmt-net
#  #provider_network_type: vlan
#  #provider_segmentation_id: 1000
#  provider_physical_network: physnet1
#  external: false
#  shared: false
#  subnet:
#    name: lb-mgmt-subnet
#    cidr: "10.1.2.0/24"
#    allocation_pool_start: "10.1.2.100"
#    allocation_pool_end: "10.1.2.200"
#    gateway_ip: "10.1.2.1"
#    enable_dhcp: yes


###############
# Kolla options
###############
# Valid options are [ COPY_ONCE, COPY_ALWAYS ]
#config_strategy: "COPY_ALWAYS"

# Valid options are ['centos', 'debian', 'rhel', 'ubuntu']
#kolla_base_distro: "centos"

# Valid options are [ binary, source ]
#kolla_install_type: "binary"

# Do not override this unless you know what you are doing.
#openstack_release: "train"

# Docker image tag used by yesfault.
#openstack_tag: "{{ openstack_release ~ openstack_tag_suffix }}"

# Suffix applied to openstack_release to generate openstack_tag.
#openstack_tag_suffix: "{{ '' if base_distro != 'centos' or ansible_distribution_major_version == '7' else  '-centos8' }}"

# Location of configuration overrides
#node_custom_config: "/etc/kolla/config"

# This should be a VIP, an unused IP on your network that will float between
# the hosts running keepalived for high-availability. If you want to run an
# All-In-One without haproxy and keepalived, you can set enable_haproxy to no
# in "OpenStack options" section, and set this value to the IP of your
# 'network_interface' as set in the Networking section below.
#kolla_internal_vip_address: "10.10.10.254"

# This is the DNS name that maps to the kolla_internal_vip_address VIP. By
# default it is the same as kolla_internal_vip_address.
#kolla_internal_fqdn: "{{ kolla_internal_vip_address }}"

# This should be a VIP, an unused IP on your network that will float between
# the hosts running keepalived for high-availability. It defaults to the
# kolla_internal_vip_address, allowing internal and external communication to
# share the same address.  Specify a kolla_external_vip_address to separate
# internal and external requests between two VIPs.
#kolla_external_vip_address: "{{ kolla_internal_vip_address }}"

# The Public address used to communicate with OpenStack as set in the public_url
# for the endpoints that will be created. This DNS name should map to
# kolla_external_vip_address.
#kolla_external_fqdn: "{{ kolla_external_vip_address }}"

################
# Docker options
################

# Custom docker registry settings:
#docker_registry:
#docker_registry_insecure: "{{ 'yes' if docker_registry else 'no' }}"
#docker_registry_username:
# docker_registry_password is set in the passwords.yml file.

# Namespace of images:
#docker_namespace: "kolla"

# Docker client timeout in seconds.
#docker_client_timeout: 120

#docker_configure_for_zun: "no"

###################
# Messaging options
###################
# Below is an example of an separate backend that provides brokerless
# messaging for oslo.messaging RPC communications

#om_rpc_transport: "amqp"
#om_rpc_user: "{{ qdrouterd_user }}"
#om_rpc_password: "{{ qdrouterd_password }}"
#om_rpc_port: "{{ qdrouterd_port }}"
#om_rpc_group: "qdrouterd"


##############################
# Neutron - Networking Options
##############################
# This interface is what all your api services will be bound to by default.
# Additionally, all vxlan/tunnel and storage network traffic will go over this
# interface by default. This interface must contain an IP address.
# It is possible for hosts to have non-matching names of interfaces - these can
# be set in an inventory file per host or per group or stored separately, see
#     http://docs.ansible.com/ansible/intro_inventory.html
# Yet another way to workaround the naming problem is to create a bond for the
# interface on all hosts and give the bond name here. Similar strategy can be
# followed for other types of interfaces.
#network_interface: "eth0"

# These can be adjusted for even more customization. The default is the same as
# the 'network_interface'. These interfaces must contain an IP address.
#kolla_external_vip_interface: "{{ network_interface }}"
#api_interface: "{{ network_interface }}"
#storage_interface: "{{ network_interface }}"
#cluster_interface: "{{ network_interface }}"
#swift_storage_interface: "{{ storage_interface }}"
#swift_replication_interface: "{{ swift_storage_interface }}"
#tunnel_interface: "{{ network_interface }}"
#dns_interface: "{{ network_interface }}"
#octavia_network_interface: "{{ api_interface }}"

# Configure the address family (AF) per network.
# Valid options are [ ipv4, ipv6 ]
#network_address_family: "ipv4"
#api_address_family: "{{ network_address_family }}"
#storage_address_family: "{{ network_address_family }}"
#cluster_address_family: "{{ network_address_family }}"
#swift_storage_address_family: "{{ storage_address_family }}"
#swift_replication_address_family: "{{ swift_storage_address_family }}"
#migration_address_family: "{{ network_address_family }}"
#tunnel_address_family: "{{ network_address_family }}"
#octavia_network_address_family: "{{ api_address_family }}"
#bifrost_network_address_family: "{{ network_address_family }}"
#dns_address_family: "{{ network_address_family }}"

# This is the raw interface given to neutron as its external network port. Even
# though an IP address can exist on this interface, it will be unusable in most
# configurations. It is recommended this interface not be configured with any IP
# addresses for that reason.
#neutron_external_interface: "eth1"

# Valid options are [ openvswitch, linuxbridge, vmware_nsxv, vmware_nsxv3, vmware_dvs, opendaylight ]
# if vmware_nsxv3 is selected, enable_openvswitch MUST be set to "no" (default is yes)
#neutron_plugin_agent: "openvswitch"

# Valid options are [ internal, infoblox ]
#neutron_ipam_driver: "internal"

# Configure Neutron upgrade option, currently Kolla support
# two upgrade ways for Neutron: legacy_upgrade and rolling_upgrade
# The variable "neutron_enable_rolling_upgrade: yes" is meaning rolling_upgrade
# were enabled and opposite
# Neutron rolling upgrade were enable by default
#neutron_enable_rolling_upgrade: "yes"


####################
# keepalived options
####################
# Arbitrary unique number from 0..255
# This should be changed from the default in the event of a multi-region deployment
# where the VIPs of different regions reside on a common subnet.
#keepalived_virtual_router_id: "51"

###################
# Dimension options
###################
# This is to provide an extra option to deploy containers with Resource constraints.
# We call it dimensions here.
# The dimensions for each container are defined by a mapping, where each dimension value should be a
# string.
# Reference_Docs
# https://docs.docker.com/config/containers/resource_constraints/
# eg:
# <container_name>_dimensions:
#    blkio_weight:
#    cpu_period:
#    cpu_quota:
#    cpu_shares:
#    cpuset_cpus:
#    cpuset_mems:
#    mem_limit:
#    mem_reservation:
#    memswap_limit:
#    kernel_memory:
#    ulimits:


#############
# TLS options
#############
# To provide encryption and authentication on the kolla_external_vip_interface,
# TLS can be enabled.  When TLS is enabled, certificates must be provided to
# allow clients to perform authentication.
#kolla_enable_tls_internal: "no"
#kolla_enable_tls_external: "{{ kolla_enable_tls_internal if kolla_same_external_internal_vip | bool else 'no' }}"
#kolla_external_fqdn_cert: "{{ node_config }}/certificates/haproxy.pem"
#kolla_internal_fqdn_cert: "{{ node_config }}/certificates/haproxy-internal.pem"
#kolla_external_fqdn_cacert: "{{ node_config }}/certificates/haproxy-ca.crt"
#kolla_internal_fqdn_cacert: "{{ node_config }}/certificates/haproxy-ca-internal.crt"

################
# Region options
################
# Use this option to change the name of this region.
#openstack_region_name: "RegionOne"

# Use this option to define a list of region names - only needs to be configured
# in a multi-region deployment, and then only in the *first* region.
#multiple_regions_names: ["{{ openstack_region_name }}"]

##############
# OpenDaylight
##############
#enable_opendaylight_qos: "no"
#enable_opendaylight_l3: "yes"

###################
# OpenStack options
###################
# Use these options to set the various log levels across all OpenStack projects
# Valid options are [ True, False ]
#openstack_logging_debug: "False"

# Enable core OpenStack services. This includes:
# glance, keystone, neutron, nova, heat, and horizon.
#enable_openstack_core: "yes"

# These roles are required for Kolla to be operation, however a savvy deployer
# could disable some of these required roles and run their own services.
#enable_glance: "{{ enable_openstack_core | bool }}"
#enable_haproxy: "yes"
#enable_keepalived: "{{ enable_haproxy | bool }}"
#enable_keystone: "{{ enable_openstack_core | bool }}"
#enable_mariadb: "yes"
#enable_memcached: "yes"
#enable_neutron: "{{ enable_openstack_core | bool }}"
#enable_nova: "{{ enable_openstack_core | bool }}"
#enable_rabbitmq: "{{ 'yes' if om_rpc_transport == 'rabbit' or om_notify_transport == 'rabbit' else 'no' }}"
#enable_outward_rabbitmq: "{{ enable_murano | bool }}"

# OpenStack services can be enabled or disabled with these options
#enable_aodh: "no"
#enable_barbican: "no"
#enable_blazar: "no"
# NOTE: This variable has been deprecated and will be removed in the U cycle.
#enable_cadf_notifications: "no"
#enable_ceilometer: "no"
#enable_ceilometer_ipmi: "no"
#enable_cells: "no"
#enable_central_logging: "no"
#enable_ceph: "no"
#enable_ceph_mds: "no"
#enable_ceph_rgw: "no"
#enable_ceph_nfs: "no"
#enable_ceph_dashboard: "{{ enable_ceph | bool }}"
#enable_chrony: "yes"
#enable_cinder: "no"
#enable_cinder_backup: "yes"
#enable_cinder_backend_hnas_nfs: "no"
#enable_cinder_backend_iscsi: "{{ enable_cinder_backend_lvm | bool or enable_cinder_backend_zfssa_iscsi | bool }}"
#enable_cinder_backend_lvm: "no"
#enable_cinder_backend_nfs: "no"
#enable_cinder_backend_zfssa_iscsi: "no"
#enable_cinder_backend_quobyte: "no"
#enable_cloudkitty: "yes"
#enable_collectd: "no"
#enable_congress: "yes"
#enable_cyborg: "no"
#enable_designate: "no"
#enable_destroy_images: "no"
#enable_elasticsearch: "{{ 'yes' if enable_central_logging | bool or enable_osprofiler | bool or enable_skydive | bool or enable_monasca | bool else 'no' }}"
#enable_elasticsearch_curator: "no"
#enable_etcd: "no"
#enable_fluentd: "yes"
#enable_freezer: "no"
#enable_gnocchi: "no"
#enable_grafana: "no"
#enable_heat: "{{ enable_openstack_core | bool }}"
#enable_horizon: "{{ enable_openstack_core | bool }}"
#enable_horizon_blazar: "{{ enable_blazar | bool }}"
#enable_horizon_cloudkitty: "{{ enable_cloudkitty | bool }}"
#enable_horizon_congress: "{{ enable_congress | bool }}"
#enable_horizon_designate: "{{ enable_designate | bool }}"
enable_horizon_fwaas: "{{ enable_neutron_fwaas | bool }}"
#enable_horizon_freezer: "{{ enable_freezer | bool }}"
#enable_horizon_heat: "{{ enable_heat | bool }}"
#enable_horizon_ironic: "{{ enable_ironic | bool }}"
#enable_horizon_karbor: "{{ enable_karbor | bool }}"
#enable_horizon_magnum: "{{ enable_magnum | bool }}"
#enable_horizon_manila: "{{ enable_manila | bool }}"
#enable_horizon_masakari: "{{ enable_masakari | bool }}"
#enable_horizon_mistral: "{{ enable_mistral | bool }}"
#enable_horizon_murano: "{{ enable_murano | bool }}"
#enable_horizon_neutron_vpnaas: "{{ enable_neutron_vpnaas | bool }}"
#enable_horizon_octavia: "{{ enable_octavia | bool }}"
#enable_horizon_qinling: "{{ enable_qinling | bool }}"
#enable_horizon_sahara: "{{ enable_sahara | bool }}"
#enable_horizon_searchlight: "{{ enable_searchlight | bool }}"
#enable_horizon_senlin: "{{ enable_senlin | bool }}"
#enable_horizon_solum: "{{ enable_solum | bool }}"
#enable_horizon_tacker: "{{ enable_tacker | bool }}"
#enable_horizon_trove: "{{ enable_trove | bool }}"
#enable_horizon_vitrage: "{{ enable_vitrage | bool }}"
#enable_horizon_watcher: "{{ enable_watcher | bool }}"
#enable_horizon_zun: "{{ enable_zun | bool }}"
#enable_hyperv: "no"
#enable_influxdb: "{{ enable_monasca | bool or (enable_cloudkitty | bool and cloudkitty_storage_backend == 'influxdb') }}"
#enable_ironic: "no"
#enable_ironic_ipxe: "no"
#enable_ironic_neutron_agent: "{{ enable_neutron | bool and enable_ironic | bool }}"
#enable_ironic_pxe_uefi: "no"
#enable_iscsid: "{{ (enable_cinder | bool and enable_cinder_backend_iscsi | bool) or enable_ironic | bool }}"
#enable_karbor: "no"
#enable_kafka: "{{ enable_monasca | bool }}"
#enable_kibana: "{{ 'yes' if enable_central_logging | bool or enable_monasca | bool else 'no' }}"
#enable_kuryr: "no"
#enable_magnum: "no"
#enable_manila: "no"
#enable_manila_backend_generic: "no"
#enable_manila_backend_hnas: "no"
#enable_manila_backend_cephfs_native: "no"
#enable_manila_backend_cephfs_nfs: "no"
#enable_mariabackup: "no"
#enable_masakari: "no"
#enable_mistral: "no"
#enable_monasca: "no"
#enable_mongodb: "no"
#enable_multipathd: "no"
#enable_murano: "no"
#enable_neutron_vpnaas: "no"
#enable_neutron_sriov: "no"
#enable_neutron_dvr: "no"
enable_neutron_fwaas: "yes"
#enable_neutron_qos: "no"
#enable_neutron_agent_ha: "no"
#enable_neutron_bgp_dragent: "no"
#enable_neutron_provider_networks: "no"
#enable_neutron_segments: "no"
#enable_neutron_sfc: "no"
#enable_neutron_metering: "no"
#enable_neutron_infoblox_ipam_agent: "no"
#enable_neutron_port_forwarding: "no"
#enable_nova_serialconsole_proxy: "no"
#enable_nova_ssh: "yes"
#enable_octavia: "no"
#enable_onos: "no"
#enable_opendaylight: "no"
#enable_openvswitch: "{{ enable_neutron | bool and neutron_plugin_agent != 'linuxbridge' }}"
#enable_ovs_dpdk: "no"
#enable_osprofiler: "no"
#enable_panko: "no"
#enable_placement: "{{ enable_nova | bool or enable_zun | bool }}"
#enable_prometheus: "no"
#enable_qdrouterd: "{{ 'yes' if om_rpc_transport == 'amqp' else 'no' }}"
#enable_qinling: "no"
#enable_rally: "no"
#enable_redis: "no"
#enable_sahara: "no"
#enable_searchlight: "no"
#enable_senlin: "no"
#enable_skydive: "no"
#enable_solum: "no"
#enable_storm: "{{ enable_monasca | bool }}"
#enable_swift: "no"
#enable_swift_s3api: "no"
#enable_tacker: "no"
#enable_telegraf: "no"
#enable_tempest: "no"
#enable_trove: "no"
#enable_trove_singletenant: "no"
#enable_vitrage: "no"
#enable_vmtp: "no"
#enable_watcher: "no"
#enable_zookeeper: "{{ enable_kafka | bool or enable_storm | bool }}"
#enable_zun: "no"

##################
# RabbitMQ options
##################
# Options passed to RabbitMQ server startup script via the
# RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS environment var.
# See Kolla Ansible docs RabbitMQ section for details.
# These are appended to args already provided by Kolla Ansible
# to configure IPv6 in RabbitMQ server.
#rabbitmq_server_additional_erl_args: ""

##############
# Ceph options
##############
# Ceph can be setup with a caching to improve performance. To use the cache you
# must provide separate disks than those for the OSDs
#ceph_enable_cache: "no"

# Set to no if using external Ceph without cephx.
#external_ceph_cephx_enabled: "yes"

# Ceph is not able to determine the size of a cache pool automatically,
# so the configuration on the absolute size is required here, otherwise the flush/evict will not work.
#ceph_target_max_bytes: ""
#ceph_target_max_objects: ""

# Valid options are [ forward, none, writeback ]
#ceph_cache_mode: "writeback"

# A requirement for using the erasure-coded pools is you must setup a cache tier
# Valid options are [ erasure, replicated ]
#ceph_pool_type: "replicated"

# Integrate ceph rados object gateway with openstack keystone
#enable_ceph_rgw_keystone: "no"

# Set the pgs and pgps for pool
# WARNING! These values are dependant on the size and shape of your cluster -
# the default values are not suitable for production use. Please refer to the
# Kolla Ceph documentation for more information.
#ceph_pool_pg_num: 8
#ceph_pool_pgp_num: 8

#############################
# Keystone - Identity Options
#############################

# Valid options are [ fernet ]
#keystone_token_provider: 'fernet'

#keystone_admin_user: "admin"

#keystone_admin_project: "admin"

# Interval to rotate fernet keys by (in seconds). Must be an interval of
# 60(1 min), 120(2 min), 180(3 min), 240(4 min), 300(5 min), 360(6 min),
# 600(10 min), 720(12 min), 900(15 min), 1200(20 min), 1800(30 min),
# 3600(1 hour), 7200(2 hour), 10800(3 hour), 14400(4 hour), 21600(6 hour),
# 28800(8 hour), 43200(12 hour), 86400(1 day), 604800(1 week).
#fernet_token_expiry: 86400


########################
# Glance - Image Options
########################
# Configure image backend.
#glance_backend_ceph: "no"
#glance_backend_file: "yes"
#glance_backend_swift: "no"
#glance_backend_vmware: "no"
#enable_glance_image_cache: "no"
# Configure glance upgrade option.
# Due to this feature being experimental in glance,
# the default value is "no".
#glance_enable_rolling_upgrade: "no"

####################
# Osprofiler options
####################
# valid values: ["elasticsearch", "redis"]
#osprofiler_backend: "elasticsearch"

##################
# Barbican options
##################
# Valid options are [ simple_crypto, p11_crypto ]
#barbican_crypto_plugin: "simple_crypto"
#barbican_library_path: "/usr/lib/libCryptoki2_64.so"

################
## Panko options
################
# Valid options are [ mongodb, mysql ]
#panko_database_type: "mysql"

#################
# Gnocchi options
#################
# Valid options are [ file, ceph ]
#gnocchi_backend_storage: "{{ 'ceph' if enable_ceph|bool else 'file' }}"

# Valid options are [redis, '']
#gnocchi_incoming_storage: "{{ 'redis' if enable_redis | bool else '' }}"

################################
# Cinder - Block Storage Options
################################
# Enable / disable Cinder backends
#cinder_backend_ceph: "{{ enable_ceph }}"
#cinder_backend_vmwarevc_vmdk: "no"
#cinder_volume_group: "cinder-volumes"
# Valid options are [ '', redis, etcd ]
#cinder_coordination_backend: "{{ 'redis' if enable_redis|bool else 'etcd' if enable_etcd|bool else '' }}"

# Valid options are [ nfs, swift, ceph ]
#cinder_backup_driver: "ceph"
#cinder_backup_share: ""
#cinder_backup_mount_options_nfs: ""

#######################
# Cloudkitty options
#######################
# Valid option is gnocchi
#cloudkitty_collector_backend: "gnocchi"
# Valid options are 'sqlalchemy' or 'influxdb'. The default value is
# 'influxdb', which matches the default in Cloudkitty since the Stein release.
# When the backend is "influxdb", we also enable Influxdb.
# Also, when using 'influxdb' as the backend, we trigger the configuration/use
# of Cloudkitty storage backend version 2.
#cloudkitty_storage_backend: "influxdb"

###################
# Designate options
###################
# Valid options are [ bind9 ]
#designate_backend: "bind9"
#designate_ns_record: "sample.openstack.org"
# Valid options are [ '', redis ]
#designate_coordination_backend: "{{ 'redis' if enable_redis|bool else '' }}"

########################
# Nova - Compute Options
########################
#nova_backend_ceph: "{{ enable_ceph }}"

# Valid options are [ qemu, kvm, vmware, xenapi ]
#nova_compute_virt_type: "kvm"

# The number of fake driver per compute node
#num_nova_fake_per_node: 5

# The flag "nova_safety_upgrade" need to be consider when
# "nova_enable_rolling_upgrade" is enabled. The "nova_safety_upgrade"
# controls whether the nova services are all stopped before rolling
# upgrade to the new version, for the safety and availability.
# If "nova_safety_upgrade" is "yes", that will stop all nova services (except
# nova-compute) for no failed API operations before upgrade to the
# new version. And opposite.
#nova_safety_upgrade: "no"

# Valid options are [ none, novnc, spice, rdp ]
#nova_console: "novnc"

#################
# Hyper-V options
#################
# Hyper-V can be used as hypervisor
#hyperv_username: "user"
#hyperv_password: "password"
#vswitch_name: "vswitch"
# URL from which Nova Hyper-V MSI is downloaded
#nova_msi_url: "https://www.cloudbase.it/downloads/HyperVNovaCompute_Beta.msi"

#############################
# Horizon - Dashboard Options
#############################
#horizon_backend_database: "{{ enable_murano | bool }}"

#############################
# Ironic options
#############################
# dnsmasq bind interface for Ironic Inspector, by default is network_interface
#ironic_dnsmasq_interface: "{{ network_interface }}"
# The following value must be set when enabling ironic,
# the value format is "192.168.0.10,192.168.0.100".
#ironic_dnsmasq_dhcp_range:
# PXE bootloader file for Ironic Inspector, relative to /tftpboot.
#ironic_dnsmasq_boot_file: "pxelinux.0"

# Configure ironic upgrade option, due to currently kolla support
# two upgrade ways for ironic: legacy_upgrade and rolling_upgrade
# The variable "ironic_enable_rolling_upgrade: yes" is meaning rolling_upgrade
# were enabled and opposite
# Rolling upgrade were enable by default
#ironic_enable_rolling_upgrade: "yes"

# List of extra kernel parameters passed to the kernel used during inspection
#ironic_inspector_kernel_cmdline_extras: []

######################################
# Manila - Shared File Systems Options
######################################
# HNAS backend configuration
#hnas_ip:
#hnas_user:
#hnas_password:
#hnas_evs_id:
#hnas_evs_ip:
#hnas_file_system_name:

################################
# Swift - Object Storage Options
################################
# Swift expects block devices to be available for storage. Two types of storage
# are supported: 1 - storage device with a special partition name and filesystem
# label, 2 - unpartitioned disk  with a filesystem. The label of this filesystem
# is used to detect the disk which Swift will be using.

# Swift support two matching modes, valid options are [ prefix, strict ]
#swift_devices_match_mode: "strict"

# This parameter defines matching pattern: if "strict" mode was selected,
# for swift_devices_match_mode then swift_device_name should specify the name of
# the special swift partition for example: "KOLLA_SWIFT_DATA", if "prefix" mode was
# selected then swift_devices_name should specify a pattern which would match to
# filesystems' labels prepared for swift.
#swift_devices_name: "KOLLA_SWIFT_DATA"

# Configure swift upgrade option, due to currently kolla support
# two upgrade ways for swift: legacy_upgrade and rolling_upgrade
# The variable "swift_enable_rolling_upgrade: yes" is meaning rolling_upgrade
# were enabled and opposite
# Rolling upgrade were enable by default
#swift_enable_rolling_upgrade: "yes"


################################################
# Tempest - The OpenStack Integration Test Suite
################################################
# The following values must be set when enabling tempest
#tempest_image_id:
#tempest_flavor_ref_id:
#tempest_public_network_id:
#tempest_floating_network_name:

# tempest_image_alt_id: "{{ tempest_image_id }}"
# tempest_flavor_ref_alt_id: "{{ tempest_flavor_ref_id }}"

###################################
# VMware - OpenStack VMware support
###################################
#vmware_vcenter_host_ip:
#vmware_vcenter_host_username:
#vmware_vcenter_host_password:
#vmware_datastore_name:
#vmware_vcenter_name:
#vmware_vcenter_cluster_name:

#######################################
# XenAPI - Support XenAPI for XenServer
#######################################
# XenAPI driver use HIMN(Host Internal Management Network)
# to communicate with XenServer host.
#xenserver_himn_ip:
#xenserver_username:
#xenserver_connect_protocol:

############
# Prometheus
############
#enable_prometheus_haproxy_exporter: "{{ enable_haproxy | bool }}"
#enable_prometheus_mysqld_exporter: "{{ enable_mariadb | bool }}"
#enable_prometheus_node_exporter: "{{ enable_prometheus | bool }}"
#enable_prometheus_cadvisor: "{{ enable_prometheus | bool }}"
#enable_prometheus_memcached: "{{ enable_prometheus | bool }}"
#enable_prometheus_alertmanager: "{{ enable_prometheus | bool }}"
#enable_prometheus_ceph_mgr_exporter: "{{ enable_prometheus | bool and enable_ceph | bool }}"
#enable_prometheus_openstack_exporter: "{{ enable_prometheus | bool }}"
#enable_prometheus_elasticsearch_exporter: "{{ enable_prometheus | bool and enable_elasticsearch | bool }}"
#enable_prometheus_blackbox_exporter: "{{ enable_prometheus | bool }}"

# List of extra parameters passed to prometheus. You can add as many to the list.
#prometheus_cmdline_extras:

#########
# Freezer
#########
# Freezer can utilize two different database backends, elasticsearch or mariadb.
# Elasticsearch is preferred, however it is not compatible with the version deployed
# by kolla-ansible. You must first setup an external elasticsearch with 2.3.0.
# By default, kolla-ansible deployed mariadb is the used database backend.
#freezer_database_backend: "mariadb"

##########
# Telegraf
##########
# Configure telegraf to use the docker daemon itself as an input for
# telemetry data.
#telegraf_enable_docker_input: "no"

EOF

sleep 5

