
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




Upgrade InvoicePlane
--------------------

### Contents

* Upgrade information
* Breaking changes
* Upgrade instructions (v1.5.11 to v1.6.0)
  1. Preliminary operations
  2. Replace files & test

---

### Upgrade information

##### Breaking changes (v1.6.0)

InvoicePlane 1.6 is based (as its versions before) on CodeIgniter v3 which officially still does not support PHP >=8.0. The InvoicePlane Community updated InvoicePlane specific components to make InvoicePlane PHP >=8.0 compatible, but not all features could be successfully ported; we will continue to put our efforts into porting the features we could not port with this upgrade. The breaking changes are:

* InvoicePlane 1.6.0 supports only Stripe as a payment gateway for online payments (please let us know what payment method you are missing at GitHub).

### Instructions to upgrade to 1.6.0 from 1.5.11

##### 1. Preliminary operations

1. Make a backup of your database and all files. (This is **very important** to prevent any data loss)
2. Download the latest version from InvoicePlane.com.

##### 2. Replace files & test

1. Copy all files to the root directory of your InvoicePlane installation but **do not** overwrite the
   following files:
   * The `ipconfig.php` file
   * Customized templates in the `application/views/` folder
   * The files for custom styles: `assets/core/css/custom.css` and `assets/core/css/custom-pdf.css`
   * Uploaded images in the `uploads/` folder (e. g. your company logo)
   * Custom language keys at `application/language/COUNTRY/custom_lang.php`
   
   **Hint:** An *easy* way of performing this operation is to upload the whole new InvoicePlane version in a different folder, outside of your current installation root folder, and copy the above mentioned files in the new folder you just uploaded. Afterwards just rename your current folder to something like `my_current_folder_old` and rename your new-version-folder with the name of `my_current_folder`.
2. Now that the files are placed, it's time to fix the `ipconfig.php` file.
   
   * open `ipconfig.php` and comment out the top line in the file by adding a `#` at the beginning of the first line. The result should be like this:
     ```
     # <?php exit('No direct script access allowed'); ?>
     ```
   * close the `ipconfig.php` file
3. Open `http://yourdomain.com/index.php/setup` and follow the instructions. The app will run all
   updates on its own.
4. Now that the `ipconfig.php` file is fixed, moved and protected, it's time to log in and see if everything is working
   * Login again and check if everything is working.
   * If you were using the online payments module please navigate to `//your-domain.com/settings` and to the tab `online payment` and disable all payment methods that are not *stripe*. InvoicePlane 1.6 at the moment supports only Stripe as a payment gateway.

If you encounter any problems please post a support request in the communtiy forums. 

Quickstart

Modules

 
 Top - © 2013-2025 InvoicePlane.com


