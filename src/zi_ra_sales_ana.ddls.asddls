@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales analytics consumption'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
    }
define view entity ZI_RA_SALES_ANA as select from ZI_RA_SALES_CUBE
{
    key _BusinessPartner.company_name,
    key _BusinessPartner.country,
    GrossAmount,
    CurrencyCode, 
    Quantity,
    UnitOfMeasure
}
