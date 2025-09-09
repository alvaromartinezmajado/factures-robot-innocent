
InvoicePlane Wiki

* General information
  
  + What is InvoicePlane?
  + Changelog
  + License
  + FAQ
* Getting started
  
  + Requirements
  + Installation
  + Quickstart (Tutorial)
  + Updating InvoicePlane
* Modules
  
  + Clients
  + Quotes
  + Invoices
  + Recurring Invoices
  + Payments
* Settings
  
  + General Settings
  + Invoice Settings
  + Quotes Settings
  + Tax Settings
  + eMail Settings
  + Online Payments
  + Updatecheck
  + Custom Fields
  + eMail Templates
  + Invoice Groups
  + Payment Methods
  + Taxrates
  + User Accounts
* Templates
  
  + Using Templates
  + Customize Templates
* System
  
  + Translation / Localization
  + Importing Data
  + Upgrade from FusionInvoice
* Links 
  + Website
  + Community Forums
  + Github Repository


* Menu

Version:

1.0


1.5


1.6




Invoice Groups
--------------

When a new invoice or quote is created, InvoicePlane uses invoice groups to determine the next invoice or quote number and how it should be structured. InvoicePlane comes with two default invoice groups - Invoice Default and Quote Default. Both groups will generate simple incremental ID's starting at the number 1, but the Quote Default will be prefixed with "QUO".


![](//invoiceplane.com/content/screenshots/web_thumb/ip_invoice_groups.jpg)


### Configure an Invoice Group

These default groups can be customized and any number of new groups can be created. Each group has a number of options.


![](//invoiceplane.com/content/screenshots/web_thumb/ip_invoice_groups_form.jpg)


| Setting | Description |
| --- | --- |
| Name | The name if the invoice group that will be used in the settings |
| Identifier formatting | The identifier is used to generate invoices or quotes and can consist of alpha-numeric characters |
| Next ID | Set the ID for the next invoice. Please notice that you should not set the next ID to a number below the ID of the last generated ID. Example: You created 59 invoices but you want the next invoice to have the ID 100 so set the Next ID to 100. |
| Left Pad | The left padding can be used to generate IDs that contain zeros to the left of the ID. The left padding contains the invoice ID itself. Example: you set the left padding to 5 which would lead to invoice IDs like 00056 or 00397. |

#### Format the Identifier

Caution! The identifier **must** contain the `{{{ID}}}` tag no matter where!

There are some template tags that can be used to create a custom identifier.

| Name | Tag | Description |
| --- | --- | --- |
| ID | `{{{ID}}}` | Inserts the increasing ID of the invoice |
| Current Year | `{{{year}}}` | Inserts the current year with 4 digits |
| Current month | `{{{month}}}` | Inserts the current month with 2 digits |
| Current day | `{{{day}}}` | Inserts the current day with 2 digits |

#### Formatting Examples

| Template | Output |
| --- | --- |
| `{{{year}}}/{{{ID}}}` | 2025/456 |
| `{{{year}}}_{{{month}}}_{{{ID}}}` | 2025\_08\_456 |
| `{{{year}}}-{{{month}}}-{{{day}}}-{{{ID}}}` | 2025-08-07-456 |
| `IN{{{year}}}{{{ID}}}` | IN2025456 |
| `IPQ-{{{day}}}{{{ID}}}` | IPQ-07456 |


Email Templates

Payment Methods

 
 Top - © 2013-2025 InvoicePlane.com


