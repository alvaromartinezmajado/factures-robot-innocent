
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




Email Settings
--------------

Before InvoicePlane can send emails you have to configure he email settings here. You can choose between three different ways to send emails.  

If you don't want that invoice and quote pdf files are automatically attached to emails disable this feature by changing `Attach Quote/Invoice on email?` to `No`


![](//invoiceplane.com/content/screenshots/web_thumb/ip_settings_mail.jpg)


| Method | Description |
| --- | --- |
| PHP Mail | Uses the built-in email sending method of PHP which allows to send mails without any configuration. |
| Sendmail | Like PHP Mail all emails will be sent without the need to configure anything. Please choose Sendmail only if you are sure that your server has Sendmail installed, enabled and configured because it is possible that your servers OS does not ship with Sendmail by default. |
| SMTP | You can also use a SMTP server to send mails. Using SMTP allows you to send emails via external servers. You will need the SMTP server's hostname, login credentials and the used port and security method. |


Tax Settings

Merchant Account Settings

 
 Top - © 2013-2025 InvoicePlane.com


