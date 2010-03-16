module ProposalDatesHelper

  def proposal_date_approved_by(proposal_date_id, user_id)
    ProposalDateUser.exists?(["user_id = ? AND proposal_date_id = ?", user_id, proposal_date_id])
  end

  def pdate_color(pdate)
    inviteds = Participation.find_attenders_for(pdate.meeting_id)# id degli invitati all'evento
    if no_confirmation_for(pdate.id)
      'red'
    elsif confirmed_by_all(pdate)
      'green'
    else
      'yellow'
    end
  end

  def thumb_img(proposal_date_id, user_id)
     '/images/thumb_' + (proposal_date_approved_by(proposal_date_id, user_id) ? 'up.gif' : 'down.gif')
  end

  def thumb_img_hover(proposal_date_id, user_id)
     '/images/thumb_' + (proposal_date_approved_by(proposal_date_id, user_id) ? 'down.gif' : 'up.gif')
  end

  def thumb_action(proposal_date_id, user_id)
     (proposal_date_approved_by(proposal_date_id, user_id) ? 'destroy' : 'create')
  end

  def attender_ids_for
    ProposalDateUser.find(:all, :conditions => ['proposal_date_id = ?', @pdate_current.id]).collect {|pdu| pdu.user_id}
  end

  def no_confirmation_for(proposal_date_id)
    pds = ProposalDateUser.all(:conditions => ['proposal_date_id = ?', proposal_date_id])
    pds ||= []
    pds.empty?
  end

  def email_type
    return 'proposal' if ProposalDateUser.all(:conditions => ['proposal_date_id = ?', @pdate_current.id]).empty?
    return 'fixed' if confirmed_by_all(@pdate_current)
    return 'unstable'
  end

  def confirmed_by_all(pdate)
    inviteds = Participation.find_attenders_for(pdate.meeting_id)# id degli invitati all'evento
    pds = ProposalDateUser.all(:conditions => ['proposal_date_id = ?', pdate.id])# Tutte le accettazioni per la data proposta
    inviteds ||= []
    pds ||= []
    pds.size == inviteds.size
  end

end
