import AppKit
import Foundation

// MARK: - PublishCreateRepo

public class PublishCreateRepo: NSBox {

  // MARK: Lifecycle

  public init(_ parameters: Parameters) {
    self.parameters = parameters

    super.init(frame: .zero)

    setUpViews()
    setUpConstraints()

    update()
  }

  public convenience init(
    workspaceName: String,
    organizationName: String,
    githubOrganizations: [String],
    githubOrganizationIndex: Int,
    repositoryName: String,
    submitButtonTitle: String)
  {
    self
      .init(
        Parameters(
          workspaceName: workspaceName,
          organizationName: organizationName,
          githubOrganizations: githubOrganizations,
          githubOrganizationIndex: githubOrganizationIndex,
          repositoryName: repositoryName,
          submitButtonTitle: submitButtonTitle))
  }

  public convenience init() {
    self.init(Parameters())
  }

  public required init?(coder aDecoder: NSCoder) {
    self.parameters = Parameters()

    super.init(coder: aDecoder)

    setUpViews()
    setUpConstraints()

    update()
  }

  // MARK: Public

  public var workspaceName: String {
    get { return parameters.workspaceName }
    set {
      if parameters.workspaceName != newValue {
        parameters.workspaceName = newValue
      }
    }
  }

  public var organizationName: String {
    get { return parameters.organizationName }
    set {
      if parameters.organizationName != newValue {
        parameters.organizationName = newValue
      }
    }
  }

  public var githubOrganizations: [String] {
    get { return parameters.githubOrganizations }
    set {
      if parameters.githubOrganizations != newValue {
        parameters.githubOrganizations = newValue
      }
    }
  }

  public var githubOrganizationIndex: Int {
    get { return parameters.githubOrganizationIndex }
    set {
      if parameters.githubOrganizationIndex != newValue {
        parameters.githubOrganizationIndex = newValue
      }
    }
  }

  public var onChangeGithubOrganizationsIndex: ((Int) -> Void)? {
    get { return parameters.onChangeGithubOrganizationsIndex }
    set { parameters.onChangeGithubOrganizationsIndex = newValue }
  }

  public var repositoryName: String {
    get { return parameters.repositoryName }
    set {
      if parameters.repositoryName != newValue {
        parameters.repositoryName = newValue
      }
    }
  }

  public var onChangeRepositoryName: StringHandler {
    get { return parameters.onChangeRepositoryName }
    set { parameters.onChangeRepositoryName = newValue }
  }

  public var submitButtonTitle: String {
    get { return parameters.submitButtonTitle }
    set {
      if parameters.submitButtonTitle != newValue {
        parameters.submitButtonTitle = newValue
      }
    }
  }

  public var onClickSubmitButton: (() -> Void)? {
    get { return parameters.onClickSubmitButton }
    set { parameters.onClickSubmitButton = newValue }
  }

  public var parameters: Parameters {
    didSet {
      if parameters != oldValue {
        update()
      }
    }
  }

  // MARK: Private

  private var titleContainerView = NSBox()
  private var publishTextView = LNATextField(labelWithString: "")
  private var workspaceTitleView = LNATextField(labelWithString: "")
  private var publishText1View = LNATextField(labelWithString: "")
  private var orgTitleView = LNATextField(labelWithString: "")
  private var vSpacerView = NSBox()
  private var bodyTextView = LNATextField(labelWithString: "")
  private var vSpacer1View = NSBox()
  private var textView = LNATextField(labelWithString: "")
  private var vSpacer3View = NSBox()
  private var view1View = NSBox()
  private var view2View = NSBox()
  private var view3View = NSBox()
  private var githubOrganizationsDropdownView = ControlledDropdown()
  private var repositoryNameInputView = TextInput()
  private var vSpacer2View = NSBox()
  private var viewView = NSBox()
  private var submitButtonView = PrimaryButton()

  private var publishTextViewTextStyle = TextStyles.titleLight
  private var workspaceTitleViewTextStyle = TextStyles.title
  private var publishText1ViewTextStyle = TextStyles.titleLight
  private var orgTitleViewTextStyle = TextStyles.title
  private var bodyTextViewTextStyle = TextStyles.body
  private var textViewTextStyle = TextStyles.subtitle

  private func setUpViews() {
    boxType = .custom
    borderType = .noBorder
    contentViewMargins = .zero
    titleContainerView.boxType = .custom
    titleContainerView.borderType = .noBorder
    titleContainerView.contentViewMargins = .zero
    vSpacerView.boxType = .custom
    vSpacerView.borderType = .noBorder
    vSpacerView.contentViewMargins = .zero
    bodyTextView.lineBreakMode = .byWordWrapping
    vSpacer1View.boxType = .custom
    vSpacer1View.borderType = .noBorder
    vSpacer1View.contentViewMargins = .zero
    textView.lineBreakMode = .byWordWrapping
    vSpacer3View.boxType = .custom
    vSpacer3View.borderType = .noBorder
    vSpacer3View.contentViewMargins = .zero
    view1View.boxType = .custom
    view1View.borderType = .noBorder
    view1View.contentViewMargins = .zero
    publishTextView.lineBreakMode = .byWordWrapping
    workspaceTitleView.lineBreakMode = .byWordWrapping
    publishText1View.lineBreakMode = .byWordWrapping
    orgTitleView.lineBreakMode = .byWordWrapping
    view2View.boxType = .custom
    view2View.borderType = .noBorder
    view2View.contentViewMargins = .zero
    vSpacer2View.boxType = .custom
    vSpacer2View.borderType = .noBorder
    vSpacer2View.contentViewMargins = .zero
    viewView.boxType = .custom
    viewView.borderType = .noBorder
    viewView.contentViewMargins = .zero
    view3View.boxType = .custom
    view3View.borderType = .noBorder
    view3View.contentViewMargins = .zero

    addSubview(titleContainerView)
    addSubview(vSpacerView)
    addSubview(bodyTextView)
    addSubview(vSpacer1View)
    addSubview(textView)
    addSubview(vSpacer3View)
    addSubview(view1View)
    titleContainerView.addSubview(publishTextView)
    titleContainerView.addSubview(workspaceTitleView)
    titleContainerView.addSubview(publishText1View)
    titleContainerView.addSubview(orgTitleView)
    view1View.addSubview(view2View)
    view1View.addSubview(vSpacer2View)
    view1View.addSubview(viewView)
    view2View.addSubview(view3View)
    view2View.addSubview(repositoryNameInputView)
    view3View.addSubview(githubOrganizationsDropdownView)
    viewView.addSubview(submitButtonView)

    publishTextView.attributedStringValue = publishTextViewTextStyle.apply(to: "Publish ")
    publishTextViewTextStyle = TextStyles.titleLight
    publishTextView.attributedStringValue = publishTextViewTextStyle.apply(to: publishTextView.attributedStringValue)
    workspaceTitleViewTextStyle = TextStyles.title
    workspaceTitleView.attributedStringValue =
      workspaceTitleViewTextStyle.apply(to: workspaceTitleView.attributedStringValue)
    publishText1View.attributedStringValue = publishText1ViewTextStyle.apply(to: " to ")
    publishText1ViewTextStyle = TextStyles.titleLight
    publishText1View.attributedStringValue = publishText1ViewTextStyle.apply(to: publishText1View.attributedStringValue)
    orgTitleViewTextStyle = TextStyles.title
    orgTitleView.attributedStringValue = orgTitleViewTextStyle.apply(to: orgTitleView.attributedStringValue)
    vSpacerView.fillColor = #colorLiteral(red: 0.847058823529, green: 0.847058823529, blue: 0.847058823529, alpha: 1)
    bodyTextView.attributedStringValue =
      bodyTextViewTextStyle.apply(to: "Great! Let’s create a new Github repository now.")
    bodyTextViewTextStyle = TextStyles.body
    bodyTextView.attributedStringValue = bodyTextViewTextStyle.apply(to: bodyTextView.attributedStringValue)
    vSpacer1View.fillColor = #colorLiteral(red: 0.847058823529, green: 0.847058823529, blue: 0.847058823529, alpha: 1)
    textView.attributedStringValue = textViewTextStyle.apply(to: "Create new repository")
    textViewTextStyle = TextStyles.subtitle
    textView.attributedStringValue = textViewTextStyle.apply(to: textView.attributedStringValue)
    vSpacer3View.fillColor = #colorLiteral(red: 0.847058823529, green: 0.847058823529, blue: 0.847058823529, alpha: 1)
    vSpacer2View.fillColor = #colorLiteral(red: 0.847058823529, green: 0.847058823529, blue: 0.847058823529, alpha: 1)
  }

  private func setUpConstraints() {
    translatesAutoresizingMaskIntoConstraints = false
    titleContainerView.translatesAutoresizingMaskIntoConstraints = false
    vSpacerView.translatesAutoresizingMaskIntoConstraints = false
    bodyTextView.translatesAutoresizingMaskIntoConstraints = false
    vSpacer1View.translatesAutoresizingMaskIntoConstraints = false
    textView.translatesAutoresizingMaskIntoConstraints = false
    vSpacer3View.translatesAutoresizingMaskIntoConstraints = false
    view1View.translatesAutoresizingMaskIntoConstraints = false
    publishTextView.translatesAutoresizingMaskIntoConstraints = false
    workspaceTitleView.translatesAutoresizingMaskIntoConstraints = false
    publishText1View.translatesAutoresizingMaskIntoConstraints = false
    orgTitleView.translatesAutoresizingMaskIntoConstraints = false
    view2View.translatesAutoresizingMaskIntoConstraints = false
    vSpacer2View.translatesAutoresizingMaskIntoConstraints = false
    viewView.translatesAutoresizingMaskIntoConstraints = false
    view3View.translatesAutoresizingMaskIntoConstraints = false
    repositoryNameInputView.translatesAutoresizingMaskIntoConstraints = false
    githubOrganizationsDropdownView.translatesAutoresizingMaskIntoConstraints = false
    submitButtonView.translatesAutoresizingMaskIntoConstraints = false

    let titleContainerViewTopAnchorConstraint = titleContainerView.topAnchor.constraint(equalTo: topAnchor)
    let titleContainerViewLeadingAnchorConstraint = titleContainerView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let titleContainerViewTrailingAnchorConstraint = titleContainerView
      .trailingAnchor
      .constraint(equalTo: trailingAnchor)
    let vSpacerViewTopAnchorConstraint = vSpacerView.topAnchor.constraint(equalTo: titleContainerView.bottomAnchor)
    let vSpacerViewLeadingAnchorConstraint = vSpacerView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let bodyTextViewTopAnchorConstraint = bodyTextView.topAnchor.constraint(equalTo: vSpacerView.bottomAnchor)
    let bodyTextViewLeadingAnchorConstraint = bodyTextView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let bodyTextViewTrailingAnchorConstraint = bodyTextView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
    let vSpacer1ViewTopAnchorConstraint = vSpacer1View.topAnchor.constraint(equalTo: bodyTextView.bottomAnchor)
    let vSpacer1ViewLeadingAnchorConstraint = vSpacer1View.leadingAnchor.constraint(equalTo: leadingAnchor)
    let textViewTopAnchorConstraint = textView.topAnchor.constraint(equalTo: vSpacer1View.bottomAnchor)
    let textViewLeadingAnchorConstraint = textView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let textViewTrailingAnchorConstraint = textView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
    let vSpacer3ViewTopAnchorConstraint = vSpacer3View.topAnchor.constraint(equalTo: textView.bottomAnchor)
    let vSpacer3ViewLeadingAnchorConstraint = vSpacer3View.leadingAnchor.constraint(equalTo: leadingAnchor)
    let view1ViewBottomAnchorConstraint = view1View.bottomAnchor.constraint(equalTo: bottomAnchor)
    let view1ViewTopAnchorConstraint = view1View.topAnchor.constraint(equalTo: vSpacer3View.bottomAnchor)
    let view1ViewLeadingAnchorConstraint = view1View.leadingAnchor.constraint(equalTo: leadingAnchor)
    let view1ViewTrailingAnchorConstraint = view1View.trailingAnchor.constraint(equalTo: trailingAnchor)
    let publishTextViewHeightAnchorParentConstraint = publishTextView
      .heightAnchor
      .constraint(lessThanOrEqualTo: titleContainerView.heightAnchor)
    let workspaceTitleViewHeightAnchorParentConstraint = workspaceTitleView
      .heightAnchor
      .constraint(lessThanOrEqualTo: titleContainerView.heightAnchor)
    let publishText1ViewHeightAnchorParentConstraint = publishText1View
      .heightAnchor
      .constraint(lessThanOrEqualTo: titleContainerView.heightAnchor)
    let orgTitleViewHeightAnchorParentConstraint = orgTitleView
      .heightAnchor
      .constraint(lessThanOrEqualTo: titleContainerView.heightAnchor)
    let publishTextViewLeadingAnchorConstraint = publishTextView
      .leadingAnchor
      .constraint(equalTo: titleContainerView.leadingAnchor)
    let publishTextViewTopAnchorConstraint = publishTextView.topAnchor.constraint(equalTo: titleContainerView.topAnchor)
    let publishTextViewBottomAnchorConstraint = publishTextView
      .bottomAnchor
      .constraint(equalTo: titleContainerView.bottomAnchor)
    let workspaceTitleViewLeadingAnchorConstraint = workspaceTitleView
      .leadingAnchor
      .constraint(equalTo: publishTextView.trailingAnchor)
    let workspaceTitleViewTopAnchorConstraint = workspaceTitleView
      .topAnchor
      .constraint(equalTo: titleContainerView.topAnchor)
    let workspaceTitleViewBottomAnchorConstraint = workspaceTitleView
      .bottomAnchor
      .constraint(equalTo: titleContainerView.bottomAnchor)
    let publishText1ViewLeadingAnchorConstraint = publishText1View
      .leadingAnchor
      .constraint(equalTo: workspaceTitleView.trailingAnchor)
    let publishText1ViewTopAnchorConstraint = publishText1View
      .topAnchor
      .constraint(equalTo: titleContainerView.topAnchor)
    let publishText1ViewBottomAnchorConstraint = publishText1View
      .bottomAnchor
      .constraint(equalTo: titleContainerView.bottomAnchor)
    let orgTitleViewLeadingAnchorConstraint = orgTitleView
      .leadingAnchor
      .constraint(equalTo: publishText1View.trailingAnchor)
    let orgTitleViewTopAnchorConstraint = orgTitleView.topAnchor.constraint(equalTo: titleContainerView.topAnchor)
    let orgTitleViewBottomAnchorConstraint = orgTitleView
      .bottomAnchor
      .constraint(equalTo: titleContainerView.bottomAnchor)
    let vSpacerViewHeightAnchorConstraint = vSpacerView.heightAnchor.constraint(equalToConstant: 32)
    let vSpacerViewWidthAnchorConstraint = vSpacerView.widthAnchor.constraint(equalToConstant: 0)
    let vSpacer1ViewHeightAnchorConstraint = vSpacer1View.heightAnchor.constraint(equalToConstant: 72)
    let vSpacer1ViewWidthAnchorConstraint = vSpacer1View.widthAnchor.constraint(equalToConstant: 0)
    let vSpacer3ViewHeightAnchorConstraint = vSpacer3View.heightAnchor.constraint(equalToConstant: 32)
    let vSpacer3ViewWidthAnchorConstraint = vSpacer3View.widthAnchor.constraint(equalToConstant: 0)
    let view2ViewTopAnchorConstraint = view2View.topAnchor.constraint(equalTo: view1View.topAnchor)
    let view2ViewLeadingAnchorConstraint = view2View.leadingAnchor.constraint(equalTo: view1View.leadingAnchor)
    let view2ViewTrailingAnchorConstraint = view2View.trailingAnchor.constraint(equalTo: view1View.trailingAnchor)
    let vSpacer2ViewTopAnchorConstraint = vSpacer2View.topAnchor.constraint(equalTo: view2View.bottomAnchor)
    let vSpacer2ViewTrailingAnchorConstraint = vSpacer2View.trailingAnchor.constraint(equalTo: view1View.trailingAnchor)
    let viewViewBottomAnchorConstraint = viewView.bottomAnchor.constraint(equalTo: view1View.bottomAnchor)
    let viewViewTopAnchorConstraint = viewView.topAnchor.constraint(equalTo: vSpacer2View.bottomAnchor)
    let viewViewTrailingAnchorConstraint = viewView.trailingAnchor.constraint(equalTo: view1View.trailingAnchor)
    let view3ViewHeightAnchorParentConstraint = view3View
      .heightAnchor
      .constraint(lessThanOrEqualTo: view2View.heightAnchor)
    let repositoryNameInputViewHeightAnchorParentConstraint = repositoryNameInputView
      .heightAnchor
      .constraint(lessThanOrEqualTo: view2View.heightAnchor)
    let view3ViewLeadingAnchorConstraint = view3View.leadingAnchor.constraint(equalTo: view2View.leadingAnchor)
    let view3ViewTopAnchorConstraint = view3View.topAnchor.constraint(equalTo: view2View.topAnchor)
    let view3ViewBottomAnchorConstraint = view3View.bottomAnchor.constraint(equalTo: view2View.bottomAnchor)
    let repositoryNameInputViewTrailingAnchorConstraint = repositoryNameInputView
      .trailingAnchor
      .constraint(equalTo: view2View.trailingAnchor)
    let repositoryNameInputViewLeadingAnchorConstraint = repositoryNameInputView
      .leadingAnchor
      .constraint(equalTo: view3View.trailingAnchor, constant: 8)
    let repositoryNameInputViewTopAnchorConstraint = repositoryNameInputView
      .topAnchor
      .constraint(equalTo: view2View.topAnchor)
    let repositoryNameInputViewBottomAnchorConstraint = repositoryNameInputView
      .bottomAnchor
      .constraint(equalTo: view2View.bottomAnchor)
    let vSpacer2ViewHeightAnchorConstraint = vSpacer2View.heightAnchor.constraint(equalToConstant: 8)
    let vSpacer2ViewWidthAnchorConstraint = vSpacer2View.widthAnchor.constraint(equalToConstant: 0)
    let viewViewWidthAnchorConstraint = viewView.widthAnchor.constraint(equalToConstant: 250)
    let submitButtonViewTopAnchorConstraint = submitButtonView.topAnchor.constraint(equalTo: viewView.topAnchor)
    let submitButtonViewBottomAnchorConstraint = submitButtonView
      .bottomAnchor
      .constraint(equalTo: viewView.bottomAnchor)
    let submitButtonViewLeadingAnchorConstraint = submitButtonView
      .leadingAnchor
      .constraint(equalTo: viewView.leadingAnchor)
    let submitButtonViewTrailingAnchorConstraint = submitButtonView
      .trailingAnchor
      .constraint(equalTo: viewView.trailingAnchor)
    let view3ViewWidthAnchorConstraint = view3View.widthAnchor.constraint(equalToConstant: 100)
    let githubOrganizationsDropdownViewTopAnchorConstraint = githubOrganizationsDropdownView
      .topAnchor
      .constraint(equalTo: view3View.topAnchor)
    let githubOrganizationsDropdownViewBottomAnchorConstraint = githubOrganizationsDropdownView
      .bottomAnchor
      .constraint(equalTo: view3View.bottomAnchor)
    let githubOrganizationsDropdownViewLeadingAnchorConstraint = githubOrganizationsDropdownView
      .leadingAnchor
      .constraint(equalTo: view3View.leadingAnchor)
    let githubOrganizationsDropdownViewTrailingAnchorConstraint = githubOrganizationsDropdownView
      .trailingAnchor
      .constraint(equalTo: view3View.trailingAnchor)

    publishTextViewHeightAnchorParentConstraint.priority = NSLayoutConstraint.Priority.defaultLow
    workspaceTitleViewHeightAnchorParentConstraint.priority = NSLayoutConstraint.Priority.defaultLow
    publishText1ViewHeightAnchorParentConstraint.priority = NSLayoutConstraint.Priority.defaultLow
    orgTitleViewHeightAnchorParentConstraint.priority = NSLayoutConstraint.Priority.defaultLow
    view3ViewHeightAnchorParentConstraint.priority = NSLayoutConstraint.Priority.defaultLow
    repositoryNameInputViewHeightAnchorParentConstraint.priority = NSLayoutConstraint.Priority.defaultLow

    NSLayoutConstraint.activate([
      titleContainerViewTopAnchorConstraint,
      titleContainerViewLeadingAnchorConstraint,
      titleContainerViewTrailingAnchorConstraint,
      vSpacerViewTopAnchorConstraint,
      vSpacerViewLeadingAnchorConstraint,
      bodyTextViewTopAnchorConstraint,
      bodyTextViewLeadingAnchorConstraint,
      bodyTextViewTrailingAnchorConstraint,
      vSpacer1ViewTopAnchorConstraint,
      vSpacer1ViewLeadingAnchorConstraint,
      textViewTopAnchorConstraint,
      textViewLeadingAnchorConstraint,
      textViewTrailingAnchorConstraint,
      vSpacer3ViewTopAnchorConstraint,
      vSpacer3ViewLeadingAnchorConstraint,
      view1ViewBottomAnchorConstraint,
      view1ViewTopAnchorConstraint,
      view1ViewLeadingAnchorConstraint,
      view1ViewTrailingAnchorConstraint,
      publishTextViewHeightAnchorParentConstraint,
      workspaceTitleViewHeightAnchorParentConstraint,
      publishText1ViewHeightAnchorParentConstraint,
      orgTitleViewHeightAnchorParentConstraint,
      publishTextViewLeadingAnchorConstraint,
      publishTextViewTopAnchorConstraint,
      publishTextViewBottomAnchorConstraint,
      workspaceTitleViewLeadingAnchorConstraint,
      workspaceTitleViewTopAnchorConstraint,
      workspaceTitleViewBottomAnchorConstraint,
      publishText1ViewLeadingAnchorConstraint,
      publishText1ViewTopAnchorConstraint,
      publishText1ViewBottomAnchorConstraint,
      orgTitleViewLeadingAnchorConstraint,
      orgTitleViewTopAnchorConstraint,
      orgTitleViewBottomAnchorConstraint,
      vSpacerViewHeightAnchorConstraint,
      vSpacerViewWidthAnchorConstraint,
      vSpacer1ViewHeightAnchorConstraint,
      vSpacer1ViewWidthAnchorConstraint,
      vSpacer3ViewHeightAnchorConstraint,
      vSpacer3ViewWidthAnchorConstraint,
      view2ViewTopAnchorConstraint,
      view2ViewLeadingAnchorConstraint,
      view2ViewTrailingAnchorConstraint,
      vSpacer2ViewTopAnchorConstraint,
      vSpacer2ViewTrailingAnchorConstraint,
      viewViewBottomAnchorConstraint,
      viewViewTopAnchorConstraint,
      viewViewTrailingAnchorConstraint,
      view3ViewHeightAnchorParentConstraint,
      repositoryNameInputViewHeightAnchorParentConstraint,
      view3ViewLeadingAnchorConstraint,
      view3ViewTopAnchorConstraint,
      view3ViewBottomAnchorConstraint,
      repositoryNameInputViewTrailingAnchorConstraint,
      repositoryNameInputViewLeadingAnchorConstraint,
      repositoryNameInputViewTopAnchorConstraint,
      repositoryNameInputViewBottomAnchorConstraint,
      vSpacer2ViewHeightAnchorConstraint,
      vSpacer2ViewWidthAnchorConstraint,
      viewViewWidthAnchorConstraint,
      submitButtonViewTopAnchorConstraint,
      submitButtonViewBottomAnchorConstraint,
      submitButtonViewLeadingAnchorConstraint,
      submitButtonViewTrailingAnchorConstraint,
      view3ViewWidthAnchorConstraint,
      githubOrganizationsDropdownViewTopAnchorConstraint,
      githubOrganizationsDropdownViewBottomAnchorConstraint,
      githubOrganizationsDropdownViewLeadingAnchorConstraint,
      githubOrganizationsDropdownViewTrailingAnchorConstraint
    ])
  }

  private func update() {
    workspaceTitleView.attributedStringValue = workspaceTitleViewTextStyle.apply(to: workspaceName)
    orgTitleView.attributedStringValue = orgTitleViewTextStyle.apply(to: organizationName)
    githubOrganizationsDropdownView.values = githubOrganizations
    githubOrganizationsDropdownView.selectedIndex = githubOrganizationIndex
    githubOrganizationsDropdownView.onChangeIndex = handleOnChangeGithubOrganizationsIndex
    repositoryNameInputView.textValue = repositoryName
    repositoryNameInputView.onChangeTextValue = handleOnChangeRepositoryName
    submitButtonView.titleText = submitButtonTitle
    submitButtonView.onClick = handleOnClickSubmitButton
    repositoryNameInputView.placeholderString = "Repository name"
  }

  private func handleOnChangeGithubOrganizationsIndex(_ arg0: Int) {
    onChangeGithubOrganizationsIndex?(arg0)
  }

  private func handleOnChangeRepositoryName(_ arg0: String) {
    onChangeRepositoryName?(arg0)
  }

  private func handleOnClickSubmitButton() {
    onClickSubmitButton?()
  }
}

// MARK: - Parameters

extension PublishCreateRepo {
  public struct Parameters: Equatable {
    public var workspaceName: String
    public var organizationName: String
    public var githubOrganizations: [String]
    public var githubOrganizationIndex: Int
    public var repositoryName: String
    public var submitButtonTitle: String
    public var onChangeGithubOrganizationsIndex: ((Int) -> Void)?
    public var onChangeRepositoryName: StringHandler
    public var onClickSubmitButton: (() -> Void)?

    public init(
      workspaceName: String,
      organizationName: String,
      githubOrganizations: [String],
      githubOrganizationIndex: Int,
      repositoryName: String,
      submitButtonTitle: String,
      onChangeGithubOrganizationsIndex: ((Int) -> Void)? = nil,
      onChangeRepositoryName: StringHandler = nil,
      onClickSubmitButton: (() -> Void)? = nil)
    {
      self.workspaceName = workspaceName
      self.organizationName = organizationName
      self.githubOrganizations = githubOrganizations
      self.githubOrganizationIndex = githubOrganizationIndex
      self.repositoryName = repositoryName
      self.submitButtonTitle = submitButtonTitle
      self.onChangeGithubOrganizationsIndex = onChangeGithubOrganizationsIndex
      self.onChangeRepositoryName = onChangeRepositoryName
      self.onClickSubmitButton = onClickSubmitButton
    }

    public init() {
      self
        .init(
          workspaceName: "",
          organizationName: "",
          githubOrganizations: [],
          githubOrganizationIndex: 0,
          repositoryName: "",
          submitButtonTitle: "")
    }

    public static func ==(lhs: Parameters, rhs: Parameters) -> Bool {
      return lhs.workspaceName == rhs.workspaceName &&
        lhs.organizationName == rhs.organizationName &&
          lhs.githubOrganizations == rhs.githubOrganizations &&
            lhs.githubOrganizationIndex == rhs.githubOrganizationIndex &&
              lhs.repositoryName == rhs.repositoryName && lhs.submitButtonTitle == rhs.submitButtonTitle
    }
  }
}

// MARK: - Model

extension PublishCreateRepo {
  public struct Model: LonaViewModel, Equatable {
    public var id: String?
    public var parameters: Parameters
    public var type: String {
      return "PublishCreateRepo"
    }

    public init(id: String? = nil, parameters: Parameters) {
      self.id = id
      self.parameters = parameters
    }

    public init(_ parameters: Parameters) {
      self.parameters = parameters
    }

    public init(
      workspaceName: String,
      organizationName: String,
      githubOrganizations: [String],
      githubOrganizationIndex: Int,
      repositoryName: String,
      submitButtonTitle: String,
      onChangeGithubOrganizationsIndex: ((Int) -> Void)? = nil,
      onChangeRepositoryName: StringHandler = nil,
      onClickSubmitButton: (() -> Void)? = nil)
    {
      self
        .init(
          Parameters(
            workspaceName: workspaceName,
            organizationName: organizationName,
            githubOrganizations: githubOrganizations,
            githubOrganizationIndex: githubOrganizationIndex,
            repositoryName: repositoryName,
            submitButtonTitle: submitButtonTitle,
            onChangeGithubOrganizationsIndex: onChangeGithubOrganizationsIndex,
            onChangeRepositoryName: onChangeRepositoryName,
            onClickSubmitButton: onClickSubmitButton))
    }

    public init() {
      self
        .init(
          workspaceName: "",
          organizationName: "",
          githubOrganizations: [],
          githubOrganizationIndex: 0,
          repositoryName: "",
          submitButtonTitle: "")
    }
  }
}