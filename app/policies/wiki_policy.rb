class WikiPolicy < ApplicationPolicy
  
  def show?
    user.present?
  end
  
  def update?
    user.present?
  end
  
  def edit?
    # All users should be able to edit any public wiki.
    # Private wikis can only be edited by admins or the wiki creator
    case record.private
      when false
        #Handle public wikis. All users should be able to edit any public wiki
        true if user.present?
      when true
        #Handle private wikis. Must be admin, or the post creator to edit private wiki
        # Must be Admin or wiki creator to update
        true if user.present? && (user.admin? || record.user == user)
      else
        #Dissallow any other record.private value
        false
    end
  end
  
end