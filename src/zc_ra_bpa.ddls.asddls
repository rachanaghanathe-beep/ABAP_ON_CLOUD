@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BPA Consumption view'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: {
  typeName: 'Business Partner',
  typeNamePlural: 'Business Partners',
  title: { type: #STANDARD, value: 'CompanyName' }
}
define view entity ZC_RA_BPA as select from ZRA_CDS1
{   
          @UI.facet: [{
        id          : 'BusinessPartner',
        purpose     : #STANDARD,
        type        : #IDENTIFICATION_REFERENCE,
        label       : 'Business Partner',
        position    : 10
      }]
      
    @UI.lineItem:       [{ position: 10 }]
      @UI.selectionField: [{ position: 10 }]
  key BpId,

      @UI.lineItem:       [{ position: 20 }]
      @UI.selectionField: [{ position: 20 }]
      CompanyName,

      @UI.lineItem:       [{ position: 30 }]
      @UI.selectionField: [{ position: 30 }]
      Country,

      @UI.lineItem:       [{ position: 40 }]
      City,

      @UI.lineItem:       [{ position: 50 }]
      Street,

      @UI.lineItem:       [{ position: 60 }]
      Region,

      @UI.lineItem:       [{ position: 70 }]
      BpRole
}
