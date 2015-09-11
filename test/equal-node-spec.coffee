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
    describe 'when given a message, it calls the callback containing the message', ->
      beforeEach ->
        @config =
          right: 5
          left: 5
        @data = {}
        @callback = sinon.spy()
        @message =
           hi : 'how are you'
        @sendMessage =
           message: @message
        @sut = new EqualNode(@config, @data)
        @sut.onMessage(@message, @callback)
      it 'should call the callback with the message', ->
        expect(@callback).to.have.been.calledWith(null, @sendMessage)

      describe '-onMessage', ->
        describe 'should recieve no message', ->
          beforeEach ->
            @config =
              right: 6
              left: 5
            @data = {}
            @callback = sinon.spy()
            @message =
               hi : 'how are you'
            @sendMessage =
               message: @message
            @sut = new EqualNode(@config, @data)
            @sut.onMessage(@message, @callback)
          it 'should call the callback with false', ->
            expect(@callback).to.have.been.calledWith(false)
