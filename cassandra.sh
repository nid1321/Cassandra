CREATE TABLE IF NOT EXISTS nsl_iot_hub.attribute (
    entity_id uuid,
    attr_id uuid,
    attr_name text,
    attribute_sequence text,
    default_value text,
    format_id uuid,
    is_mandatory boolean,
    is_optional boolean,
    ishidden boolean,
    ismandatory boolean,
    jsonoptionsbyparententitykey text,
    max_val int,
    min_val int,
    multivalue boolean,
    size int,
    table_name text,
    table_structure text,
    tooltip text,
    type text,
    type_ahead boolean,
    updated_on timestamp,
    validation text,
    validation_json text,
    validations text,
    conditionalpotentiality list<text>,
    options list<text>,
    validation_ids list<uuid>,
    versions set<int>,
    PRIMARY KEY (entity_id, attr_id));
CREATE TABLE IF NOT EXISTS nsl_iot_hub.autoid_counter (
    solution_id uuid,
    cu_id uuid,
    entity_id uuid,
    attr_id uuid,
    counter_id uuid,
    counter_val int,
    max_val int,
    min_val int,
    PRIMARY KEY (solution_id, cu_id, entity_id))
    WITH ID = be45ecd0-4af5-11ed-8408-fbfb0aef1fae;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.autoid_formats (
    format_id uuid PRIMARY KEY,
    format text)
    WITH ID = 700e8450-4ae1-11ed-8408-fbfb0aef1fae;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.available_feature (
    id uuid PRIMARY KEY,
    feature text,
    menu_name text)
    WITH ID = 20627d50-3a9f-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.change_driver (
    id uuid,
    user_id uuid,
    eg_json text,
    execution_language text,
    function text,
    is_global boolean,
    name text,
    upload_file_name text,
    verb text,
    PRIMARY KEY (id, user_id))
    WITH ID = eb6ec670-3a9f-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.change_unit (
    cu_id uuid PRIMARY KEY,
    created_by uuid,
    created_on timestamp,
    cu_name text,
    is_required boolean,
    sensor_id uuid,
    status text,
    child_ids set<uuid>,
    parent_ids set<uuid>);
CREATE TABLE IF NOT EXISTS nsl_iot_hub.cu_change_drivers (
    cu_id uuid,
    id uuid,
    change_driver_id uuid,
    cu_cd_sequence int,
    input_entities list<uuid>,
    output_entities list<uuid>,
    PRIMARY KEY (cu_id, id))
    WITH ID = 6ef767c0-3ab6-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.cu_entities (
    cu_id uuid,
    id uuid,
    entity_id uuid,
    entity_layer text,
    entity_view text,
    ishidden boolean,
    ismandatory boolean,
    multivalue boolean,
    attribute_ids list<uuid>,
    versions set<int>,
    PRIMARY KEY (cu_id, id));
CREATE TABLE IF NOT EXISTS nsl_iot_hub.cu_execution_logic (
    ssa_id uuid,
    cu_id uuid,
    cu_index int,
    cu_comment text,
    cu_statement text,
    cu_type text,
    PRIMARY KEY (ssa_id, cu_id, cu_index))
    WITH ID = 4ec76860-3abb-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.cu_master (
    cu_id uuid,
    usr_id uuid,
    agent_type text,
    api_endpoint text,
    created_on timestamp,
    cu_name text,
    description text,
    domain_id uuid,
    egjson text,
    is_global boolean,
    is_required boolean,
    is_reserve boolean,
    isasync boolean,
    sentence_key text,
    updated_by_id uuid,
    updated_on timestamp,
    versions set<int>,
    sentence boolean,
    PRIMARY KEY (cu_id, usr_id));
CREATE TABLE IF NOT EXISTS nsl_iot_hub.device (
    device_id uuid PRIMARY KEY,
    created_by uuid,
    created_on timestamp,
    ip text,
    mac_id text,
    type text,
    sensor_ids map<uuid, text>)
    WITH ID = 7a45e2e0-3ab7-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.device_log (
    device_id uuid,
    last_update_time timestamp,
    connected_time timestamp,
    ip text,
    PRIMARY KEY (device_id, last_update_time))
    WITH ID = c3ae4e40-3ab7-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.device_master (
    entity_id uuid,
    device_id uuid,
    created_by uuid,
    created_on timestamp,
    ip text,
    mac_id text,
    type text,
    selected_cus list<uuid>,
    sensor_status map<uuid, text>,
    PRIMARY KEY (entity_id, device_id))
    WITH ID = 07c9c2d0-3ab8-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.dictionary (
    id uuid PRIMARY KEY,
    definition text,
    word text,
    wordtype text)
    WITH ID = 68ac4890-3abb-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.domain (
    id uuid PRIMARY KEY,
    name text,
    url text)
    WITH ID = 260d4cc0-3ab9-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.entity (
    usr_id uuid,
    entity_id uuid,
    created_on timestamp,
    entity_name text,
    entity_noun text,
    entity_view text,
    entitylayer text,
    is_global boolean,
    is_mandatory boolean,
    is_optional boolean,
    ishidden boolean,
    multivalue boolean,
    parententityid uuid,
    updated_on timestamp,
    child_entities list<uuid>,
    versions set<int>,
    PRIMARY KEY (usr_id, entity_id));
CREATE TABLE IF NOT EXISTS nsl_iot_hub.function_constant (
    id uuid PRIMARY KEY,
    display_name text,
    function_type text,
    name text,
    number_of_parameters text,
    sequence int,
    symbols text)
    WITH ID = 063f4050-3aba-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.irdr (
    irdr_id uuid,
    cu_id uuid,
    cu_name text,
    role_id uuid,
    role_name text,
    sol_read boolean,
    sol_write boolean,
    txn_execute boolean,
    txn_read boolean,
    txn_write boolean,
    user_id uuid,
    user_name text,
    PRIMARY KEY (irdr_id, cu_id))
    WITH ID = 35cbeec0-4859-11ed-802f-81382bc045e6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.meta_data (
    metadataid uuid PRIMARY KEY,
    category text,
    description text,
    solution_id uuid,
    sub_category text,
    user_id uuid,
    keywords list<text>)
    WITH ID = 801c2690-3aba-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.role (
    role_id uuid PRIMARY KEY,
    info text,
    parent_id uuid,
    parent_name text,
    role_name text,
    status text,
    user_ids list<uuid>)
    WITH ID = 29fc4040-4859-11ed-802f-81382bc045e6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.setup (
    menu_name text,
    type text,
    key text,
    value text,
    PRIMARY KEY (menu_name, type, key))
    WITH ID = 2adaa160-3abb-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.solution_builder (
    solution_name text,
    template_id uuid,
    tag_id text,
    ssa_id uuid,
    event_name text,
    solution_type text,
    PRIMARY KEY (solution_name, template_id, tag_id, ssa_id))
    WITH ID = da6ec020-3abb-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.solution_constant (
    constant_id uuid PRIMARY KEY,
    solution_name text,
    solution_type text,
    symbols text)
    WITH ID = 656899d0-3abc-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.solution_master (
    solution_id uuid PRIMARY KEY,
    created_by uuid,
    created_by_name text,
    created_on timestamp,
    gsi_name text,
    gsi_status text,
    irdr_rights text,
    solution_json text,
    solution_origin text,
    solution_type text,
    updated_on timestamp,
    user_id uuid,
    solution_gsi_id list<uuid>);
CREATE TABLE IF NOT EXISTS nsl_iot_hub.solution_space (
    id uuid PRIMARY KEY,
    created_on timestamp,
    device_id uuid,
    is_execute boolean,
    user_id uuid,
    solution list<text>);
CREATE TABLE IF NOT EXISTS nsl_iot_hub.solution_ssa (
    solution_id uuid,
    solution_ssaid uuid,
    egjson text,
    execution_type text,
    grammarcheck text,
    irdr_rights text,
    isexecute boolean,
    isglobal boolean,
    solution_json text,
    solution_name text,
    solution_origin text,
    solution_text text,
    solution_type text,
    user_id uuid,
    PRIMARY KEY (solution_id, solution_ssaid));
CREATE TABLE IF NOT EXISTS nsl_iot_hub.solution_ssa_cu (
    solution_ssa_id uuid,
    solution_ssa_cuid uuid,
    apiendpoint text,
    description text,
    domain_id uuid,
    irdr_rights text,
    isasync boolean,
    sentence_key text,
    solution_id uuid,
    solution_ssa_cu_agent text,
    solution_ssa_cu_displayname text,
    solution_ssa_cu_eg_json text,
    solution_ssa_cu_entitylayer text,
    solution_ssa_cu_sentence text,
    solution_ssa_cuglobal boolean,
    solution_ssa_cuindex int,
    solution_ssa_cuisrequired boolean,
    solution_ssa_cuisreserve boolean,
    solution_ssa_cuisselected boolean,
    solution_ssa_cuname text,
    solution_ssa_cutype text,
    sentence boolean,
    PRIMARY KEY (solution_ssa_id, solution_ssa_cuid));
CREATE TABLE IF NOT EXISTS nsl_iot_hub.solution_ssa_cu_changedriver (
    solution_ssa_cuid uuid,
    solution_ssa_cu_driverid uuid,
    solution_id uuid,
    solution_ssa_cu_driver_executionlanguage text,
    solution_ssa_cu_driver_function text,
    solution_ssa_cu_driver_isglobal boolean,
    solution_ssa_cu_driver_name text,
    solution_ssa_cu_driver_sequence int,
    solution_ssa_cu_driver_uploadfilename text,
    solution_ssa_cu_driver_verb text,
    solution_ssa_cu_eg_json text,
    solution_ssa_cu_driver_inputentities list<uuid>,
    solution_ssa_cu_driver_outputentities list<uuid>,
    PRIMARY KEY (solution_ssa_cuid, solution_ssa_cu_driverid));
CREATE TABLE IF NOT EXISTS nsl_iot_hub.solution_ssa_cu_entity (
    solution_ssa_cuid uuid,
    solution_ssa_cu_entityid uuid,
    entity_view text,
    ishidden boolean,
    ismandatory boolean,
    solution_id uuid,
    solution_ssa_cu_entitylayer text,
    solution_ssa_cu_entitymultivalue boolean,
    solution_ssa_cu_entityname text,
    solution_ssa_cu_entitynoun text,
    solution_ssa_cu_entitytype text,
    solution_ssa_cu_isglobal boolean,
    solution_ssa_entityid uuid,
    solution_ssa_cu_childentities list<uuid>,
    PRIMARY KEY (solution_ssa_cuid, solution_ssa_cu_entityid));
CREATE TABLE IF NOT EXISTS nsl_iot_hub.solution_ssa_entity_attribute (
    solution_ssa_entityid uuid,
    solution_ssa_attributeid uuid,
    attributeevents text,
    cpdependency boolean,
    format_id uuid,
    ishidden boolean,
    max_val int,
    min_val int,
    solution_id uuid,
    solution_ssa_attribute_defaultvalue text,
    solution_ssa_attribute_ismandatory boolean,
    solution_ssa_attribute_multivalue boolean,
    solution_ssa_attribute_name text,
    solution_ssa_attribute_seq text,
    solution_ssa_attribute_size int,
    solution_ssa_attribute_type text,
    solution_ssa_attribute_validation text,
    tooltip text,
    type_ahead boolean,
    conditionalpotentiality list<text>,
    solution_ssa_attribute_options list<text>,
    solution_ssa_attribute_validation_ids list<uuid>,
    PRIMARY KEY (solution_ssa_entityid, solution_ssa_attributeid));
CREATE TABLE IF NOT EXISTS nsl_iot_hub.solution_template_map (
    templateid uuid PRIMARY KEY,
    customcolor_json text,
    font text,
    icon_json text,
    layout text,
    solutionname text,
    theme_json text,
    wallpaper text)
    WITH ID = 4a7e4bb0-485e-11ed-802f-81382bc045e6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.ssa_cycle (
    solution_name text,
    ssa_id uuid,
    created_on timestamp,
    execution_type text,
    grammarcheck text,
    gsi_name text,
    instance_id uuid,
    instance_ip text,
    instance_pwd text,
    instance_username text,
    is_execute text,
    is_global boolean,
    parent_id uuid,
    solution_json text,
    solution_text text,
    ssa_name text,
    user_id uuid,
    cu_list list<uuid>,
    PRIMARY KEY (solution_name, ssa_id));
CREATE TABLE IF NOT EXISTS nsl_iot_hub.template (
    template_id uuid PRIMARY KEY,
    components text,
    css_text text,
    html_text text,
    styles text,
    template_name text,
    total_template map<text, text>)
    WITH ID = 1ca19a60-3ac3-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.template_mapping (
    id uuid,
    template_id uuid,
    control_id text,
    control_name text,
    control_type text,
    event_type text,
    is_event boolean,
    on_error text,
    on_success text,
    request_data text,
    solution_id uuid,
    validate_before text,
    PRIMARY KEY (id, template_id))
    WITH ID = 353a2470-3ac3-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.template_solution (
    solution_name text,
    template_id uuid,
    components text,
    css_text text,
    html_text text,
    is_login_req boolean,
    is_main_page boolean,
    isloginreq boolean,
    solution_id uuid,
    template_name text,
    PRIMARY KEY (solution_name, template_id))
    WITH ID = 2893c500-3ac3-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.transactions (
    txn_id uuid PRIMARY KEY,
    assigned_status text,
    created_by uuid,
    created_on timestamp,
    cu_id uuid,
    cu_name text,
    executed_by text,
    gsi_id uuid,
    gsi_name text,
    solution_id uuid,
    txn_status text,
    updated_by uuid,
    updated_on timestamp,
    user_id uuid)
    WITH ID = 56ebc880-3ac3-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.ui_controls (
    ui_control_id uuid,
    control_name text,
    control_type text,
    created_by uuid,
    created_on timestamp,
    updated_by uuid,
    updated_on timestamp,
    PRIMARY KEY (ui_control_id, control_name))
    WITH ID = 3deae6a0-64bb-11ed-b38c-c99a8ceaf2de;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.user (
    user_id text PRIMARY KEY,
    emp_id text,
    enable boolean,
    name text,
    password text,
    role text)
    WITH ID = a501dd70-3ac3-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.useraudit (
    user_id uuid,
    id uuid,
    description text,
    firstname text,
    issuccess boolean,
    requesttimestamp timestamp,
    requesturi text,
    PRIMARY KEY (user_id, id))
    WITH ID = ca974b60-3ac3-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.userdetail (
    id uuid PRIMARY KEY,
    created_by text,
    email text,
    firstname text,
    is_enable boolean,
    lastname text,
    password text,
    role text,
    solution_id uuid,
    user_id text,
    user_type text,
    feature_list list<text>,
    role_ids list<uuid>)
    WITH ID = be4778c0-3ab5-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.user_education_details (
    person_id uuid PRIMARY KEY,
    degree text,
    degree_university text,
    degree_year text,
    field_of_study text,
    highest_degree text,
    highest_degree_university text,
    highest_degree_year text,
    specialization text)
    WITH ID = 749048c0-3ac3-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.user_feature (
    id uuid PRIMARY KEY,
    menu_name text,
    user_id text,
    feature list<text>)
    WITH ID = fb150a80-3ac2-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.user_personal_details (
    person_id uuid PRIMARY KEY,
    about_me text,
    blood_group text,
    contact_number text,
    dob text,
    email_id text,
    employee_id text,
    gender text,
    name text,
    role text)
    WITH ID = 84421370-3ac3-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.user_skills (
    id uuid PRIMARY KEY,
    rating int,
    skill text,
    user_id uuid)
    WITH ID = 9308e1e0-3ac3-11ed-a100-7bac138fccc6;
CREATE TABLE IF NOT EXISTS nsl_iot_hub.validate (
    id uuid PRIMARY KEY,
    active boolean,
    display_name text,
    extra_field text,
    input_type text,
    maximum int,
    message text,
    min_max_required boolean,
    minimum int,
    regex text,
    validation_type text)
    WITH ID = dce67d40-3ac3-11ed-a100-7bac138fccc6;
