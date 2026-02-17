//
//  SettingsDonationCellView.swift
//  Feather
//
//  Created by samara on 30.04.2025.
//

#if !NIGHTLY && !DEBUG
import SwiftUI
import NimbleViews

struct SettingsDonationCellView: View {
    var site: String
    
    var body: some View {
        Section {
            VStack(spacing: 14) {
                _title()
                
                _benefit(
                    .localized("Join Telegram"),
                    .localized("Get updates, announcements and direct support through our Telegram channel."),
                    systemName: "paperplane.fill"
                )
                _benefit(
                    .localized("Stay Connected"),
                    .localized("Be part of the community and never miss important news."),
                    systemName: "bubble.left.and.bubble.right.fill"
                )
                _benefit(
                    .localized("Show Your Support"),
                    .localized("Show your support and help the project grow and improve."),
                    systemName: "heart.fill"
                )
                
                Button {
                    UIApplication.open(site)
                } label: {
                    _sheetButton(.localized("Join Community"))
                }
                .frame(height: 45)
            }
            .padding(.vertical, 12)
            .buttonStyle(.plain)
        }
    }
    
    @ViewBuilder
    private func _title() -> some View {
        VStack(alignment: .center, spacing: 12) {
            // Bild aus Assets direkt
            Image("Xalo_love")
                .resizable()
                .frame(width: 60, height: 60)
            
            Text(.localized("Support"))
                .font(.title)
                .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    @ViewBuilder
    private func _benefit(
        _ title: String,
        _ desc: String,
        systemName: String
    ) -> some View {
        HStack(alignment: .center, spacing: 14) {
            Image(systemName: systemName)
                .font(.system(size: 32))
                .foregroundStyle(.tint)
                .frame(width: 39, alignment: .center)
            
            NBTitleWithSubtitleView(
                title: title,
                subtitle: desc
            )
        }
    }
    
    @ViewBuilder
    private func _sheetButton(_ title: String) -> some View {
        Text(title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
            )
            .bold()
    }
}

#endif
