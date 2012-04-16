require 'should'

Base58 = require '../lib/base58'

examples = require './examples'

describe 'Base58', ->
  describe '.encode', ->
    it 'encodes number to Base58 string', ->
      for str, num of examples
        Base58.encode(num).should.eql(str)

    describe 'when passed a non-number value', ->
      it 'throws an error', ->
        (-> Base58.encode('hi')).should.throw('Value passed is not a number.')

  describe '.decode', ->
    it 'decodes Base58 string to number', ->
      for str, num of examples
        Base58.decode(str).should.eql(num)

    describe 'when passed a non-Base58 string', ->
      it 'throws an error', ->
        (-> Base58.decode('>_<')).should
          .throw('Value passed not a valid Base58 string.')