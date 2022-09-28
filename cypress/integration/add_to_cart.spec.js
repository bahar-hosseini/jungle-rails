describe('Home_Page',()=>{
  beforeEach(()=>{
    cy.visit('/')
  })

  it("total amount in the cart before clicking", () => {
    cy.get("cart-test").should("include.text", " My Cart (0)");
  })
  it("total amount in the cart after clicking", () => {
    cy.get('.btn').click({force: true} )
    cy.get("cart-test").should("include.text", " My Cart (1)");
  })
})