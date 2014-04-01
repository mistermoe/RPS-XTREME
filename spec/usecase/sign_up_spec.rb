require 'spec_helper'

describe RPS::SignUp do
  it 'signs a user up' do
    username = 'wayne'
    password = 'tittybucket'

    result = RPS::SignUp.run(username: username, password: password)

    expect(result.success?).to eq(true)
    expect(result.user.username).to eq('wayne')
    expect(result.user.password).to eq('tittybucket')

  end
  it 'fails if that username already exists' do
    user = RPS.DB.create_user('franseen', 'ovulation station')

    result = RPS::SignUp.run(username: 'franseen', password: 'ovulation station' )

    expect(result.error?).to eq(true)
    expect(result.error).to eq(:user_already_exists)



  end
end
