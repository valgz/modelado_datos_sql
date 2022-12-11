
--Consulta DML para obtener:

	-- Nombre modelo, marca y grupo de coches (los nombre de todos)
	-- Fecha de compra
	-- Matricula
	-- Nombre del color del coche
	-- Total kilómetros
	-- Nombre empresa que esta asegurado el coche
	-- Numero de póliza


select a.model_name , b.brand_name , c.corp_name , d.purchase_date , d.registration_num , e.color_name , d.mileage , f.insurer_name , d.insurance_num  
from vmgg.model a, vmgg.brand b, vmgg.corporategroup c, vmgg.car d, vmgg.color e, vmgg.insurer f
where a.idmodel = d.idmodel and a.idbrand = b.idbrand and b.idcorp = c.idcorp and d.idcolor = e.idcolor and d.idinsurer = f.idinsurer
order by d.purchase_date asc