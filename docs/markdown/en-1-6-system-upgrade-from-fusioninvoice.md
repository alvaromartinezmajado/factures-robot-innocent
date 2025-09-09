
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




Upgrade form FusionInvoice v1.x
-------------------------------

If you used FusionInvoice v.1x to manage your invoices you can migrate to InvoicePlane.  
Follow these steps to
migrate your installation.

### Make a full Backup

Actually you don't have to make a full backup of your FusionInvoice setup but we recommend to do so. We can not
guarantee that the Migrationtool is working without
problems.  
Make a complete copy of the folder that holds your installation and make a backup of your
database.

### Use the Migrationtool

1. Download the Migrationtool
   and unzip it to any directory on your webserver or your local machine and check if you copied the `.htaccess`
   file.
2. If you want to run the tool in a subdirectory please set the directory in the `config.php` file.
3. Then open the URL which can access the Migrationtool and follow the instructions.

Please do **not** use multiple directories like `yourdomain.com/tools/migration/migrationtool`
as the tool only supports one directory at the moment.
### Run the InvoicePlane Updates

After converting the database it's very important that you open the setup wizard
of your InvoicePlane installation located at `yourdomain.com/setup`. Follow the instructions and the
setup will run any necessary database updates. Without these updates InvoicePlane will not run.

If you encounter any problems please post a support request in the communtiy forums. 

Importing Data
 
 Top - © 2013-2025 InvoicePlane.com


