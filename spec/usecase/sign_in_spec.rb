require 'spec_helper'

describe RPS::SignIn do
  before do
    RPS::Sessions.class_variable_set(:@@counter, 0)
  end
  it 'successfully signs a user in' do
    #look through users to find username
    user = RPS.DB.create_user('pablo pitstain', 'marvelous breasts')

    result = RPS::SignIn.run(username: user.username, password: user.password)
    expect(result.success?).to eq(true)
    expect(result.session).to eq(1)
    #if no username -> error
    #check password on retrieved user with password passed in
    #creates session
    #returns that sessions id
  end

  it 'throws an error if username does not exist' do
    result = RPS::SignIn.run(username: 'monkey piss', password: 'cellulite potholes')

    expect(result.error?).to eq(true)
    expect(result.error).to eq(:username_doesnt_exist)

  end
  it 'throws an error if password doesnt match' do
    user = RPS.DB.create_user('gorgon', 'flatulent')
    result = RPS::SignIn.run(username: 'gorgon', password: 'burgers for breasts')
    expect(result.error?).to be_true
    expect(result.error).to eq(:incorrect_password)
  end
end
