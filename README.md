# Sata Abaya Store

## Project Objective

The objective of the **Affordable Abaya Store** is to create a user-friendly e-commerce platform that offers a seamless shopping experience for affordable, high-quality abayas. The platform enhances customer satisfaction through intuitive navigation, detailed product information, and easy access to external purchase links. It aims to establish a strong online presence while providing a secure admin system for efficient product management.

## Functional Requirements

### Admin Side

#### Product Management
- Admin can **add new products** with the following details:
  - Product ID
  - Name
  - Category
  - Image
  - Description
  - Price
  - Link to external site (e.g., Amazon, Daraz, Temu)
- Admin can **edit or delete existing product information**.

#### Link Functionality
- The product listing includes a **clickable link**.
- When the user clicks on the link, the app will open the external site in a browser or embedded web view.

#### Admin Dashboard
- View reports of **affiliated** and **non-affiliated products**.

#### Product Status
- Admin can check whether a product is affiliated or non-affiliated based on whether it has an external link:
  - **Affiliate Products**: Products with external links are considered affiliated.
  - **Non-Affiliate Products**: Products without external links are non-affiliated.

### User Side

#### Product Display
- Show a list of abayas with the following details:
  - Name
  - Category
  - Price
  - Description
  - Image
  - External link (clickable)
- Clicking the link will open the respective external page.

#### Search and Filters
- Users can search for products by:
  - Name
  - Category
  - Price
- Users can **filter by price**.
