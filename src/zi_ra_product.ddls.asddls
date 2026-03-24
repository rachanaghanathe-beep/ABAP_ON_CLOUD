@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product master - Basic Interface view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_RA_PRODUCT as select from zra_product
{
    key product_id as ProductId,
    name as Name,
    category as Category,
    --@Semantics.amount.currencyCode: 'Currency'
    price as Price,
    currency as Currency,
    discount as Discount
}
