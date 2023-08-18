
describe('Add to Cart', () => {
  it('users can add a product to the cart and verify cart count', () => {
    // Visit the base URL
    cy.visit('/');

    // Verify the initial cart count is 0
    cy.get('.nav-link:contains("My Cart")').should('contain',"0");

    // Verify that there are 2 products on the page
    cy.get(".products article").should("have.length", 2);
    

    // Click the "Add to Cart" button for the first product
    cy.get(".products article")
      .first()
      .contains('Add')
      .click();

    // Verify the updated cart count is 1
    cy.get('.nav-link:contains("My Cart")').should('contain',"1");

    
  });

});