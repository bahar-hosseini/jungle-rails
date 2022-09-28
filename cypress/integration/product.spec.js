describe('Home_Page',()=>{
  beforeEach(()=>{
    cy.visit('/')
  })

  it('should go to the products page',()=>{
    cy.get('.test').first().click()
  })
})