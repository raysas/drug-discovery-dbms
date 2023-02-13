-- useful queries:
-- N.B queries' results are not necessarily correct

-- Query 1: drug Pozanicline is thought to have 50% effectiveness on those taking it. From the sample data, get the proportion of records that tested positevely from it in order to test the hypothesis

SELECT drug_name, 
       SUM(effective)/count(*) AS effectiveness_rate
FROM RECORD 
GROUP BY drug_name 
HAVING drug_name="Pozanicline";

-- Query 2: order the alleles that my lead to ADHD by their coded protein size

SELECT CONCAT(gene,variant_no) AS allele, 
	   protein_size AS amino_acids
FROM VARIANT
WHERE biotype="Protein coding " 
	AND gene IN(
		SELECT code 
		FROM GENE
		WHERE phenotype="ADHD"
	)
ORDER BY amino_acids;

-- Query 3: test whether the drug Ajmaline has same effectivness for both sexes

SELECT SUM(effective)/count(*) as percent_effect_population, 
		sex 
FROM PATIENT, 
	 RECORD
WHERE patient_id=ID 
	AND drug_name="Ajmaline"
GROUP BY SEX;

-- Query 4: study the corelation the effectiveness of experimental drugs and different age group 

SELECT age, 
		SUM(effective)
FROM PATIENT, RECORD
WHERE patient_id=id AND drug_name IN(
	SELECT generic_name
    FROM DRUG, COMPOUND
    WHERE molecule=ID AND (phase=2 OR phase=3)
)
GROUP BY age;

-- Query 5: list the name of people who were given antibody drug tests

SELECT CONCAT(first_name," ", last_name) AS name, 
		generic_name AS given
FROM PATIENT, RECORD, COMPOUND, DRUG
WHERE patient_id=PATIENT.ID AND drug_name=DRUG.generic_name AND molecule=COMPOUND.ID -- join conditions 
    AND COMPOUND.type="Antibody"
;

-- Query 6: a patient attained with alzheimer has a mutated protein of unusual length (>500 amino acids). Check the possible alleles for this
SELECT 
		CONCAT(gene, variant_no) AS allele, 
		CONCAT(chromosome_no," ",coordinates," ",strand) AS locus
FROM 
	(VARIANT 
	JOIN GENE 
	ON gene=code)
WHERE phenotype="Alzheimer" 
	AND protein_size>500;

-- Query 7: a common name for a drug is Zavesca and people became more familiar with it from 2 years. Some test trials were tested on people who got it and ried it on their own, however that's not recommended. Get the ID of people who tried it to send them a notice not to do it again
SELECT patient_id
FROM RECORD 
	JOIN 
	DRUG 
	ON drug_name=generic_name, BRAND_NAME as B
WHERE B.name="Zavesca" 
	AND test_date>'2020-1-1';

-- Query 8: you lost samples for the test trials of the drug Miglustat on patients with Niemann-Pick, and u wanna redo the process: get the contact info of these patients
SELECT *
FROM PATIENT
WHERE ID IN(
    SELECT patient_id
    FROM RECORD
    WHERE disease_name="Niemann-Pick" 
		AND drug_name="Miglustat"
);

-- Query 9: get the molecular weights of the effective drugs on parkinson

SELECT weight AS effective_parkinson_drug_weight
FROM COMPOUND
WHERE ID IN(
    SELECT molecule 
    FROM DRUG, RECORD
    WHERE drug_name=generic_name 
		AND disease_name="Parkinson" 
			AND effective=TRUE
    GROUP BY molecule
);

-- Query 10: you want to synthesize the drug Flutamide for last experimental stages, you need its chemical formula for that
SELECT molecular_formula AS Flutamide_formula
FROM DRUG 
	JOIN COMPOUND
    ON molecule=ID
WHERE generic_name="Flutamide";