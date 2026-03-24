@AbapCatalog.sqlViewName: 'ZRACDS1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View-1st'
@Metadata.ignorePropagatedAnnotations: true
define view ZRA_CDS1 as select from zra_bpa
{ 
    key bp_id as BpId,
    bp_role as BpRole,
    company_name as CompanyName,
    street as Street,
    country as Country,
    region as Region,
    city as City
}
