--useful queries:

--get whether the drug that's most efficient in treating alzheimer can occure naturally or has to be synthesized
SELECT type
FROM COMPOUND,DRUG,DISEASE,RECORD

--select the drugs that are through phase 3 or more of clinical trials

--a mutated protein of a patient attained with alzheimer has an unusual length of -aa and the gen size is -bp, try to