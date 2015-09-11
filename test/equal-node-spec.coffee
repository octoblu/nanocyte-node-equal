EqualNode = require '../src/equal-node'
describe 'OctoModel', ->
  it 'should exist', ->
    expect(EqualNode).to.exist

  describe 'when constructed', ->
    beforeEach ->
      @sut = new EqualNode

    it 'should exist', ->
      expect(@sut).to.exist

    it 'should have an onMessage function', ->
      expect(@sut.onMessage).to.exist

  describe '->onMessage', ->
    describe 'when right and left are equal', ->
      beforeEach ->
        @config =
          right: 5
          left: 5
        @callback = sinon.spy()
        @message = 'for the message'
        @sut = new EqualNode @config
        @sut.onMessage @message, @callback

      it 'should call the callback with the message', ->
        expect(@callback).to.have.been.calledWith null, @message

    describe 'when right and left are not equal', ->
      beforeEach ->
        @config =
          right: 6
          left: 5
        @data = {}
        @callback = sinon.spy()
        @message = 'what it do?'
        @sut = new EqualNode @config
        @sut.onMessage(@message, @callback)

      it 'should call the callback with false', ->
        expect(@callback).to.have.been.calledWith null
        expect(@callback).to.not.have.been.calledWith @message
