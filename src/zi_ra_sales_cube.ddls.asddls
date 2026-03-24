@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Cube-COMPOSITION'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_RA_SALES_CUBE as select from ZRI_RA_SALES
association[1] to zra_bpa as _BusinessPartner on
$projection.Buyer = _BusinessPartner.bp_id
association[1] to ZI_RA_PRODUCT as _Product on 
$projection.Product = _Product.ProductId
{
    key ZRI_RA_SALES.OrderId,
    key ZRI_RA_SALES._Items.item_id as ItemId,
    ZRI_RA_SALES.OrderNo,
   ZRI_RA_SALES.Buyer,
    ZRI_RA_SALES.CreatedBy,
    ZRI_RA_SALES.CreatedOn,
    /* Associations */
    ZRI_RA_SALES._Items.product as Product,
    @DefaultAggregation: #SUM
    @Semantics.amount.currencyCode: 'CurrencyCode'
   ZRI_RA_SALES._Items.amount as GrossAmount,
    ZRI_RA_SALES._Items.currency as CurrencyCode,
    @DefaultAggregation: #SUM
    @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
    ZRI_RA_SALES._Items.qty as Quantity,
    ZRI_RA_SALES._Items.uom as UnitOfMeasure,
    _Product,
    _BusinessPartner
}
