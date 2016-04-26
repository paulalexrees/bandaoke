DataMapper.setup(:default, "postgres://localhost/bandaoke_#{ENV['RACK_ENV']}")
DataMapper.finalize
