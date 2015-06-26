select
	distinct coalesce(p.pesNome, '!!!Está no monitore mas não está cadastrado no NetFactor!!!'), '''' + a.SConsCnpjCpf
from
	(
	select 
		distinct SConsCnpjCpf 
	from 
		nfConsultaSerasa 
	where 
		usuLogin = 'MONITORE' 
	) a
	left join netCedenteGrupoCedentes g on a.SConsCnpjCpf = g.pesCNPJCPF
	left join nfSacado s on a.SConsCnpjCpf = s.pesCNPJCPF
	left join nfPessoa p on a.SConsCnpjCpf = p.pesCNPJCPF
where a.SConsCnpjCpf not in 
	(
	select 
		distinct c.pesCNPJCPF
	from 
		nfOperacao o
		join nfCedente c on o.empCodigo = c.empCodigo and o.cedCodigo = c.cedCodigo
	where 
		opeData >= '2015-02-01' 
		and opeDataEfetivacao is not null
	)
	and (g.cedgru_id not in 
	(
	select 
		distinct c.cedgru_id
	from 
		nfOperacao o
		join nfCedente c on o.empCodigo = c.empCodigo and o.cedCodigo = c.cedCodigo
	where 
		opeData >= '2015-02-01' 
		and opeDataEfetivacao is not null
	) or cedgru_id is null)
	and a.SConsCnpjCpf not in 
	(
	select
		distinct s.pesCNPJCPF
	from 
		nfIngressos i
		join nfSacado s on i.empCodigo = s.empCodigo and i.sacCodigo = s.sacCodigo
	where 
		ingDataOpe >= '2015-02-01'
	)
	and (s.sgr_id not in 
	(
	select
		distinct s.sgr_id
	from 
		nfIngressos i
		join nfSacado s on i.empCodigo = s.empCodigo and i.sacCodigo = s.sacCodigo
	where 
		ingDataOpe >= '2015-02-01'
	) or s.sgr_id is null)
order by
	1, 2


--select * from netCedenteGrupoCedentes
--select * from netSacadoGrupo


--sp_tables '%gru%'