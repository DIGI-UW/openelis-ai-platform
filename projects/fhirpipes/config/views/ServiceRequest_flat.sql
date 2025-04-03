CREATE OR REPLACE VIEW ServiceRequest_flat AS
SELECT 
    SR.id AS id,
    SR.subject.patientId AS patient_id,
    SR.encounter.encounterId AS encounter_id,
    SR.status,
    SR.intent,
    SR.priority,
    SRC.code,
    SRC.system AS code_sys,
    SRC.display AS service_name,
    SR.authoredOn,
    SR.requester.practitionerId AS requester_id,
    SR.requester.practitionerRoleId AS requester_role_id,
    SR.requester.organizationId AS requester_org_id,
    SR.performer.practitionerId AS performer_id,
    SR.performer.practitionerRoleId AS performer_role_id,
    SR.performer.organizationId AS performer_org_id,
    SR.occurrence.dateTime AS scheduled_date,
    SR.occurrence.period.start AS period_start,
    SR.occurrence.period.end AS period_end,
    SRCatC.system AS category_sys,
    SRCatC.code AS category_code,
    SRCatC.display AS category_display,
    SR.doNotPerform,
    RC.code AS reason_code,
    RC.system AS reason_code_sys,
    RC.display AS reason_display
FROM 
    ServiceRequest AS SR
LATERAL VIEW OUTER explode(SR.code.coding) AS SRC
LATERAL VIEW OUTER explode(SR.category) AS SRCat
LATERAL VIEW OUTER explode(SRCat.coding) AS SRCatC
LATERAL VIEW OUTER explode(SR.reasonCode.coding) AS RC;