insert into active_directory
(select    
id::bigint,
    event_id,
    device_id,
    to_timestamp(cast(g_timestamp as double precision)) as g_timestamp,
    user_id,
    prior_user_id,
    '0.0.0.0'::inet + g_ip::bigint,
    s_ip::varchar(255), --'0.0.0.0'::inet + s_ip::bigint,
    '0.0.0.0'::inet + t_ip::bigint,
    transport_proto::bigint,
    t_port::bigint,
    s_port::bigint,
    g_hostname,
    s_hostname,
    t_hostname,
    malware_id,
    s_bytes,
    t_bytes,
    http_status,
    http_method,
    http_hostname,
    http_agent,
    mime_type,
    uri,
    corr_count,
    g_zone_id::bigint,
    s_zone_id::bigint,
    t_zone_id::bigint,
    nsm_type,
    message,
    instdevice_id,
    priority,
 to_timestamp(cast(acquire_timestamp as double precision)) as acquire_timestamp,
    user_id_implementer,
    user_id_requester,
    user_id_approver,
    "group_id",
    group_member_id,
    object_name,
    object_type,
    process_executable,
    object_access,
    object_action,
    in_interface,
    out_interface,
    mac,
    g_mac,
    s_mac,
    t_mac,
    '0.0.0.0'::inet + ip::bigint,
    '0.0.0.0'::inet + acquire_ip::bigint,
    '0.0.0.0'::inet + tun_s_ip::bigint,
    '0.0.0.0'::inet + tun_t_ip::bigint,
    '0.0.0.0'::inet + n_s_ip::bigint,
    '0.0.0.0'::inet + n_t_ip::bigint,
    hostname,
    acquire_hostname,
    icmp_code,
    icmp_type,
    n_s_port::bigint,
    n_t_port::bigint,
    s_email,
    t_email,
    http_referrer,
    transaction_time,
    acquire_zone_id,
    zone_id,
    device_backref
FROM gphdfs.ext_active_directory_<CHANGE_MONTHDAY>
where event_id not in ('event_id', 'da-sdw'));