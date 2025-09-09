
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




Translation / Localization
--------------------------

InvoicePlane comes with the English language by default. To contribute to or to download other language packs
please visit the translation repository.

### Install a new translation

Please notice: some translations are not complete so some texts will be displayed in English. So do not delete
the english language folder!

1. Download the translation pack from the translation
   repository
2. Open the folder of the language you want to install (`de` = German)
3. Copy the folder that should be called something like `de_DE`, `fr_FR` or
   `es_AR`
4. Paste the folder to the following directory of your InvoicePlane installation:
   `/application/language/`
5. Apply the language in your general settings.

Your folder structure should look like this:

```

├── application/
│   ├── ...
│   ├── language/
│   │   ├── english/
│   │   └── Deutsch/
│   │       ├── custom_lang.php
│   │       ├── ip_lang.php
│   │       ├── merchant_lang.php
│   │       └── ...
│   └── ...
├── assets/
└── ...
    
```
### Customize translations

You are able to replace all language strings in the application with your own strings. We added a file called `custom_lang.php` which is located in every language folder (see above).

To replace or alter a translation, search for the string in the main language files (ip\_lang.php). You have to copy the whole line with the string into the `custom_lang.php` file that it looks like this:

```

<?php
/**
 * CUSTOM LANGUAGE STRINGS
 *
 * Add .....
 */

$lang = array(

    'language_string_key' => 'Actual content of the Language String',
    
);
```

Now, simply change the translation to whatever you need. But keep in mind that some strings are designed to fit into special spaces. Try to keep the character count or the original string.

If you want to use the `'` character in your string you have to replace it with `\'`.  

Example: `'language_string_key' => 'Description with \'quotes\'',`

Templates

Importing Data

 
 Top - © 2013-2025 InvoicePlane.com


