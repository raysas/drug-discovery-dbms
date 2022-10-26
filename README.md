# DBMS project: Drug Discovery Database Management System for Genetic Neuronal Diseases

## Abstract

Drug Discovery consists of having test subjects on drugs and tracking the respective results to conclude using statistics whether the methods are effective or not. 
In this relational database management system, we have a set of entities/relations that are connected via relationships where the connection can be used by analysts to project the database into a new relation and come up with statistical inferences.

**The DBMS have the following entities:**

* **Patient**: a test subject and have one or more record(s) of drug experiments on his/her genetic neuronal disease
* **Record**: each patient has a record for a test expirement, it must contain a reference for a disease present in this patient along with the drug used for this particular test expirement. A record of the result must be tracked.
* **Disease**: each disease can be found in the record and must be associated to one or more gene (in case of genetic epistasis: multiple genes affecting the same trait since this dbms in restrictly dealing with genetic diseases
* **Gene**: associated to a genetic disease
* **Drug**: given for a test experiment for treatment and is composed of one or more compounds
* **Chemical Compounds**: can be used in multiple drugs
