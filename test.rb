require_relative 'boggle'

test_board = [
  ["t", "g", "c", "a"],
  ["h", "t", "o", "v"],
  ["t", "t", "qu", "r"],
  ["s", "b", "e", "i"]]

test_dictionary = Dictionary.new(%w(a act actor avo be bet beth bets bettor cog coquet coquets cor core cot cote coth cots cott cotter cotts eth go goa gor gore gori got goth gov i ire oca or ore otter ova quiet quiets quire quote quoter quoth reb rebs rei ret rets roc roque roquet roquets rot rote rots rotte stoa store stot stott to toc tog toque toquet toquets tor tore tori torque tot tote toter tots vac vor vote voter vrot))

test_answer = %w(a act actor avo be bet beth bets bettor cog coquet coquets cor core cot cote coth cots cott cotter cotts eth go goa gor gore gori got goth gov i ire oca or ore otter ova quiet quiets quire quote quoter quoth reb rebs rei ret rets roc roque roquet roquets rot rote rots rotte stoa store stot stott to toc tog toque toquet toquets tor tore tori torque tot tote toter tots vac vor vote voter vrot)

kevins_test = Boggle.new(test_board, test_dictionary )
answer = kevins_test.boggle(test_board)
p answer
p answer == test_answer
