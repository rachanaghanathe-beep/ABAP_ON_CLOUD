@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BPA - Example '
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_RA_SO_CDS 
as select from zra_bpa
{ 
key bp_id as BpId,
bp_role as BpRole,
company_name as CompanyName,
street as Street,
country as Country,
region as Region,
city as City
}
