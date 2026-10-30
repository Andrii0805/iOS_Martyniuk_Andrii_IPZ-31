import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var consentSwitch: UISwitch!
    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    let games = [
        "Minecraft",
        "Cyberpunk 2077",
        "GTA VII",
        "The Witcher 4",
        "Counter-Strike 2",
        "Red Dead Redemption 2",
        "Elden Ring"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        cityPickerView.delegate = self
        cityPickerView.dataSource = self

        nameTextField.placeholder = "Введіть свій нікнейм"
        statusLabel.text = "GAMER PROFILE"

        consentSwitch.isOn = false
        updateTheme()
    }

 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return games.count
    }

    func pickerView(_ pickerView: UIPickerView,
                    attributedTitleForRow row: Int,
                    forComponent component: Int) -> NSAttributedString? {
        let color: UIColor = consentSwitch.isOn ? .init(red: 0.541, green: 0.969, blue: 0.659, alpha: 1) : .black
        return NSAttributedString(
            string: games[row],
            attributes: [.foregroundColor: color]
        )
    }

    

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        let nickname = nameTextField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        guard !nickname.isEmpty else {
            statusLabel.text = "Введіть нікнейм!"
            return
        }

        let selectedRow = cityPickerView.selectedRow(inComponent: 0)
        let selectedGame = games[selectedRow]

        let profile = UserProfile(
            nickname: nickname,
            favoriteGame: selectedGame,
            isDarkMode: consentSwitch.isOn
        )

        print("----- GAMER PROFILE -----")
        print("Нікнейм: \(profile.nickname)")
        print("Улюблена гра: \(profile.favoriteGame)")
        print("Тема: \(profile.isDarkMode ? "Нічна" : "Денна")")
        print("-------------------------")

        statusLabel.text = "Профіль збережено!"
    }

    @IBAction func themeSwitchChanged(_ sender: UISwitch) {
        UIView.animate(withDuration: 0.25) {
            self.updateTheme()
        }
    }

   

    func updateTheme() {
        let isDark = consentSwitch.isOn

        let bgColor = isDark
            ? UIColor(red: 0.08, green: 0.08, blue: 0.12, alpha: 1)
            : UIColor.white

        view.backgroundColor = bgColor
        scrollView.backgroundColor = bgColor
        contentView.backgroundColor = bgColor

        statusLabel.textColor = isDark ? .init(red: 0.541, green: 0.969, blue: 0.659, alpha: 1) : .black

        nameTextField.textColor = isDark ? .init(red: 0.541, green: 0.969, blue: 0.659, alpha: 1) : .black
        nameTextField.backgroundColor = isDark
            ? UIColor.darkGray
            : UIColor.systemGray6

        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Введіть свій нікнейм",
            attributes: [
                .foregroundColor: isDark ? UIColor.lightGray : UIColor.gray
            ]
        )

       
        cityPickerView.reloadAllComponents()
    }
}
