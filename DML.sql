
-- Nombre modelo, marca y grupo de coches (los nombre de todos)
-- Fecha de compra
-- Matricula
-- Nombre del color del coche
-- Total kilómetros
-- Nombre empresa que esta asegurado el coche
-- Numero de póliza


select a.model_name , b.brand_name , c.corp_name , d.purchase_date , d.registration_num , e.color_name , d.mileage , f.insurer_name , d.insurance_num  
from practica.model a, practica.brand b, practica.corporategroup c, practica.car d, practica.color e, practica.insurer f
where a.idmodel = d.idmodel and a.idbrand = b.idbrand and b.idcorp = c.idcorp and d.idcolor = e.idcolor and d.idinsurer = f.idinsurer;
