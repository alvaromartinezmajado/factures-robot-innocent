
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




Online Payment Settings
-----------------------

InvoicePlane 1.6 supports only **Stripe** by default as a payment gateway. The reason why the other providers were dropped can be found here. Please let us know what payment method you are missing at GitHub

#### Configure your payment provider

To configure your payment provider, select the provider from the dropdown list. If you don't know which provider should be selected please contact your provider. We cannot offer any support for specific provider settings.

After selecting a provider InvoicePlane will show you a configuration box will all needed settings. Make sure to enable the provider first. After that fill all needed information. Again: if you are not shure which fields to fill, contact your provider.

It is highly recommended to test if the online payment is working correctly using the **Test Mode** if available. This allows you to pay online without transfering real money.
#### Configure **Stripe** as a payment provider

1. Login or regiser for an account at stripe.com
2. Once you logged in, on the top search bar look for the `API Keys` page.
3. Create a new *secret key*.
4. Now, open the `settings` in your InvoicePlane installation and navigate to the `online payment` tab.
5. Tick the `Enable Online Payments` checkbox.
6. From the dropdown list select `Stripe` as a payment provider.
7. Tick the `enable` checkbox on the stripe card that appeared when you selected stripe as a payment provider in the last step.
8. Insert the secret key and the publishable key in the corrisponding fields. The secret key must be set in the field that hides the characters (like a password).
9. Click on **save**, and you are done!

Please take note that InvoicePlane is in no way affiliated to Stripe and that we are not able to help with Stripe specific issues. These instructions only concern integrating Stripe as a payment gateway in InvoicePlane.

eMail Settings

Updatecheck

 
 Top - © 2013-2025 InvoicePlane.com


