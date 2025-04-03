CREATE OR REPLACE VIEW Observation_flat AS
SELECT 
    O.id AS id, 
    O.subject.patientId AS patient_id,
    O.encounter.encounterId AS encounter_id,
    O.status, 
    OCC.code, 
    OCC.system AS code_sys, 
    OCC.display AS obs_name,  -- Adding the display field from the code
    O.value.quantity.value AS val_quantity,
    OVCC.code AS val_code, 
    OVCC.system AS val_sys, 
    OVCC.display AS obs_value,  -- Adding the display field from the value codeable concept
    O.effective.dateTime AS obs_date,
    OCatC.system AS category_sys,
    OCatC.code AS category_code,
    OCatC.display AS category_display  -- Adding the display field from the category coding
FROM 
    Observation AS O 
LATERAL VIEW OUTER explode(O.code.coding) AS OCC
LATERAL VIEW OUTER explode(O.value.codeableConcept.coding) AS OVCC
LATERAL VIEW OUTER explode(O.category) AS OCat
LATERAL VIEW OUTER explode(OCat.coding) AS OCatC;