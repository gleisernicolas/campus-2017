class Task < ApplicationRecord
  def status
    if done == false
      retorno = 'Imcomplete'
    else
      retorno = 'Done'
    end
    retorno
  end

  def done?
    @done
  end

end
