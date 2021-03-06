module Sym
  # All public exceptions of this library are here.
  module Errors
    # Exceptions superclass for this library.
    class Sym::Errors::Error < StandardError; end

    # No secret has been provided for encryption or decryption
    class InsufficientOptionsError < Sym::Errors::Error; end

    class PasswordError < Sym::Errors::Error; end
    class PasswordsDontMatch < Sym::Errors::PasswordError; end
    class PasswordTooShort < Sym::Errors::PasswordError; end

    class EditorExitedAbnormally < Sym::Errors::Error; end

    class FileNotFound < Sym::Errors::Error; end

    class DataEncodingVersionMismatch< Sym::Errors::Error; end

    class KeyError < Sym::Errors::Error; end
    class InvalidEncodingPrivateKey < Sym::Errors::KeyError; end
    class InvalidPasswordPrivateKey < Sym::Errors::KeyError; end
    class NoPrivateKeyFound < Sym::Errors::KeyError; end

    class KeyChainCommandError < Sym::Errors::Error; end

    # Method was called on an abstract class. Override such methods in
    # subclasses, and use subclasses for instantiation of objects.
    class AbstractMethodCalled < ArgumentError
      def initialize(method, message = nil)
        super("Abstract method call, on #{method}" + (message || ''))
      end
    end
  end
end


