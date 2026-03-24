@EndUserText.label: 'Table function for customer sales'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE

define table function ZRA_TF
with parameters
  @Environment.systemField: #CLIENT
  p_clnt : mandt                        
returns {
  client        : abap.clnt;
  company_name  : abap.char(256);
  total_sales   : abap.curr(15,2);
  currency_code : abap.cuky(5);
  customer_rank : abap.int4;
}
implemented by method zcl_ra_amdp=>get_total_sales;