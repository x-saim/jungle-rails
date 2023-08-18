describe("Product Details", () => {

  it('should visit the selected products page', () => {
    // Visit the base URL
    cy.visit('/');
    cy.contains('The Jungle');

    // Click on a product
    cy.get('[alt="Scented Blade"]').click()


     // Assertions for the product detail page
     cy.get('.product-detail').should('exist'); // Check that the product detail section exists
     cy.get('.main-img').should('be.visible'); // Check that the main image is visible

     // Check that the product name is present
     cy.get('.product-detail h1').should('contain', 'Scented Blade'); 

     // Check that the product description is present
     cy.get('.product-detail p').should('exist'); 

     // Check product quantity and price is present
      cy.get('.quantity').should('exist'); 
     
     // Check that the "Add to Cart" button is present
     cy.get('.price').should('contain', 'Add');
     cy.get('.btn').should('be.visible');
 

  });
})